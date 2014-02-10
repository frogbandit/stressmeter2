class ReviewsController < ApplicationController
  # GET /reviews
  # GET /reviews.json
  def index
    @reviewnames = Review.uniq.pluck(:name)
    @reviews = Review.all
    @title = "Stressometer | Home"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviewnames }
    end
  end

  def showall
    @reviewnames = Review.uniq.pluck(:name)
    @title = "Stressometer | All Classes"
    render 'showall.html.erb'
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find_by_name(params[:name])
    @title = "Stressometer | " + @review[:name]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  def search
    @review = Review.find_by_name(params[:name])
    render 'show.html.erb'
  end



  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new
    @title = "Stressometer | New Review"
    @classname = params[:classname]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create

    @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to '/', notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  def addcoursenames
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

    @page_url = "http://www.college.columbia.edu/bulletin/depts/mealac.php"
    @base_url = "http://www.college.columbia.edu/"
    page = Nokogiri::HTML(open(@page_url))

    #puts page.css("title")[0].name
    #puts page.css("title")[0].text

    links = page.css("#Departments_of_Instruction").css("a")

    links[2..3].each do |link|
      href = link["href"]
      remote_url = @base_url + href + "?tab=courses"
      #puts remote_url
      page2 = Nokogiri::HTML(open(remote_url))
      courses = page2.css(".course-description p strong")
      courses.each do |title| 
        @name = "#{title.text}"
        @review = Review.new(name: @name)
        if @review.save
          @title = "worked"
        else
          @title = "did not work"
        end
      end


      #puts link.text
    end
    #@review2 = Review.new(name: "Review2")
    render 'index.html.erb'
  end
=begin    require 'net/http'
    @url = 'http://data.adicu.com/courses?school=columbia%20college&api_token=d88f860c4d7d11e394bf12313d000d18'
    @results = Net::HTTP.get(URI.parse(@url))
    @resultsjson = JSON.parse(@results)
    @resultsjson["data"].each do |result|
      @name = result["CourseTitle"]
      @review = Review.new(name: @name)
      @review.save
    end
    render 'index.html.erb'
  end
=end

end
