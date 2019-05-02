class Api::V1::SurvivorsController < Api::V1::ApiController
	
	# GET /api/v1/survivors
	def index
		@survivors = Survivor.order(created_at: :desc)
   		render json: @survivors
	end

	 # GET /api/v1/survivors/1
	def show
		@survivor = Survivor.find(params[:id])
		render json: @survivor
	end

	# POST /api/v1/survivors
	def create
 
		@survivor = Survivor.new(survivor_params)

		if @survivor.save

			render json: @survivor, status: :created

		else
			#render json: @survivor.errors, status: :unprocessable_entity
			render json: {status: 'ERROR', message:'Survivor not saved', data: @survivor.errors}, status: :unprocessable_entity
		end

	end

	# PATCH/PUT /api/v1/survivors/1
	def update
		@survivor = Survivor.find(params[:id])

		if @survivor.update(survivor_params)
			render json: @survivor
		else
			render json: {status: 'ERROR', message:'Survivor not updated', data: @survivor.errors},status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/survivors/1
	def destroy

		@survivor = Survivor.find(params[:id])

		@survivor.destroy

		render json: {status: 'SUCCESS', message:'Survivor deleted', data: @survivor},status: :ok
	end

	#allowed params
	private
	def survivor_params
		params.permit(:name, :gender, :latitude, :longitude)
	end
end
