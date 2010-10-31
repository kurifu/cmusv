class DeliverablesController < ApplicationController
  # GET /deliverables
  # GET /deliverables.xml
  def index
    @deliverables = Deliverables.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deliverables }
    end
  end

  # GET /deliverables/1
  # GET /deliverables/1.xml
  def show
    #
    # GET TEAM DEFINED FOR DELIVERABLE
    #
    person = Person.find(params[:person_id])
    person_teams = person.teams
    @deliverable = Deliverables.find(params[:id])
    submitter_team  = @deliverable.team

    if person.is_staff || (person_teams and person_teams.index(submitter_team) != nil)
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @deliverable }
      end
    else
      redirect_to :action => 'index'
    end
  
  end

  # GET /deliverables/new
  # GET /deliverables/new.xml
  def new
    @deliverable = Deliverables.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deliverable }
    end
  end

  # GET /deliverables/1/edit
  def edit
    person = Person.find(params[:person_id])
    person_teams = person.teams
    @deliverable = Deliverables.find(params[:id])
    submitter_team  = @deliverable.team

    if not person.is_staff || (person_teams and person_teams.index(submitter_team) != nil)
      redirect_to :action => 'index'
    end
  end

  # POST /deliverables
  # POST /deliverables.xml
  def create
    @deliverable = Deliverables.new(params[:deliverable])

    respond_to do |format|
      if @deliverable.save
        flash[:notice] = 'Deliverable was successfully created.'
        format.html { redirect_to(@deliverable) }
        format.xml  { render :xml => @deliverable, :status => :created, :location => @deliverable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deliverables/1
  # PUT /deliverables/1.xml
  def update
    person = Person.find(params[:person_id])
    person_teams = person.teams
    @deliverable = Deliverables.find(params[:id])
    submitter_team  = @deliverable.team

    if person.is_staff || (person_teams and person_teams.index(submitter_team) != nil)
      respond_to do |format|
        if @deliverable.update_attributes(params[:deliverable])
          flash[:notice] = 'Deliverable was successfully updated.'
          format.html { redirect_to(@deliverable) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @deliverable.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to :action => 'index'
    end
  end

  # DELETE /deliverables/1
  # DELETE /deliverables/1.xml
  def destroy
    @deliverable = Deliverables.find(params[:id])
    @deliverable.destroy

    respond_to do |format|
      format.html { redirect_to(deliverables_url) }
      format.xml  { head :ok }
    end
  end
end
