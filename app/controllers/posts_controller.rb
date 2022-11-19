class PostsController < ApplicationController
  before_action :set_post, only: %i[ show modal edit update destroy ]
  # protect_from_forgery except: :show
  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @username = User.find_by(id: @post.user_id).name
    @time_since_created = verbose_count(time_since(@post.created_at).map(&:to_i))[0]
  end

  def modal
    @username = User.find_by(id: @post.user_id).name
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    Comment.destroy_by(post_id: @post.id)

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :image, :user_id, :featured_image)
    end

    def verbose_count(time)
      rtime = time.reverse
      sum_time = 0
      [[0, 'second'], [60, 'minute'], [60, 'hour'], [24, 'day'], [7, 'week'], [52, 'year']].reverse.map.with_index do |arr, dex|
        next if rtime[dex] == 0
        sum_time = (sum_time + rtime[dex]) * arr[0]
        rtime[dex + 1] -= sum_time unless arr[0] == 0
        "#{rtime[dex]} #{arr[1].pluralize(rtime[dex])}"
      end.compact
    end

    def time_since(start)
      sec = Time.now - start
      min = sec / 60
      hour = min / 60
      day = hour / 24
      week = day / 7
      year = day / 365
      [sec, min, hour, day, week, year]
    end
end

