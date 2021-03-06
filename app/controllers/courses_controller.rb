class CoursesController < ApplicationController
   layout 'cmu_sv'
  
   before_filter :require_user

  # GET /courses
  # GET /courses.xml
  def index
    @all_courses = true
    @courses = Course.find(:all, :order => "year DESC, semester DESC, number ASC")
    @courses = @courses.sort_by { |c| -c.sortable_value } # note the '-' is for desc sorting

    index_core
  end
  
  def current_semester
    @all_courses = false
    @semester = ApplicationController.current_semester()
    @year = Date.today.year
    @courses = Course.for_semester(@semester, @year)
    index_core
  end

  def next_semester
    @all_courses = false
    @semester = ApplicationController.next_semester()
    @year = ApplicationController.next_semester_year()
    @courses = Course.for_semester(@semester, @year)
    index_core
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])

#    teams = Team.find_by_course_id(params[:id])
    teams = Team.find(:all, :conditions => ["course_id = ?", params[:id]])

    @emails = []
    teams.each do |team|
      team.people.each do |person|
        @emails << person.email
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new
    @course.semester = ApplicationController.current_semester
    @course.year = Time.now.year
    @course_numbers = CourseNumber.find(:all, :order => "name")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    @course_numbers = CourseNumber.find(:all, :order => "name")

  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(params[:course])
    @course_template = CourseNumber.find(params[:course][:course_number_id]) unless params[:course][:course_number_id].blank?
    if @course_template
      @course.name = @course_template.name
      @course.number = @course_template.number      
    end

    respond_to do |format|
      if @course.save
        flash[:notice] = 'Course was successfully created.'
        format.html { redirect_to(@course) }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        flash[:notice] = 'Course was successfully updated.'
        format.html { redirect_to(@course) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end

  # Page with form to submit a deliverable attachment (zip)
  def submit_deliverable
    @deliverable = Deliverables.new
    respond_to do |format|
      format.html
    end
    
  end

=begin
  def create_deliverable
    puts "Inside create_deliverable"
    @deliverable = Deliverables.new(params[:deliverable])

    if @deliverable.save
      puts "WORKS?!"
      redirect_to(@deliverable, :notice => 'Deliverable was created successfully! YEE!')
    else

      if @deliverable.zip_file_name.blank?
        puts "Detected bad submit"
        #flash[:errors_zip] = "Please enter a Zip attachment<br\>"
      else
        puts "did not catch bad submit"
      end

      redirect_to :action => "submit_deliverable"
    end
  end
=end
  private
  def index_core
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @courses }
    end
  end
end
