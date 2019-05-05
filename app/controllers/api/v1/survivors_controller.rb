class Api::V1::SurvivorsController < Api::V1::ApiController
	
	# GET /api/v1/survivors
	def index

		survivor = Survivor.all

		#Percentage of abducted survivors
		abducted_survivors = Survivor.where(abducted: true)
		abductions = "#{(abducted_survivors.count.to_f / survivor.count) * 100}%"

		#Percentage of non-abducted survivors
		non_abducted_survivors = Survivor.where(abducted: false)
		non_abductions =  "#{(non_abducted_survivors.count.to_f / survivor.count) * 100}%"

		#Listing all survivors names, by alphabetic order, with an identification to know who was abducted
		survivors = Survivor.select(:id, :name, :abducted).order(:name)

		render json: {reports: {abductions_percentage: abductions, non_abductions_percentage: non_abductions, survivors: survivors}}
	end

	 # GET /api/v1/survivors/1
	def show
		survivor = Survivor.find(params[:id])
		render json: survivor
	end

	# POST /api/v1/survivors
	def create
 
		survivor = Survivor.new(survivor_params)

		if survivor.save

			render json: survivor, status: 201
			#201: The request has been fulfilled and resulted in a new resource being created

		else
			render json: { errors: survivor.errors }, status: 422
			#422: The request was well-formed but was unable to be followed due to semantic errors

		end

	end

	# PATCH/PUT /api/v1/survivors/1
	def update
		survivor = Survivor.find(params[:id])

		if survivor.update(survivor_params)
			render json: survivor, status: 200
			#200: OK
		else
			render json: { errors: survivor.errors }, status: 422
		end
	end

	# DELETE /api/v1/survivors/1
	def destroy

		survivor = Survivor.find(params[:id])

		survivor.destroy

		render json: {status: 200, message:'Survivor deleted'}
	end

	#allowed params
	private
	def survivor_params
		params.permit(:name, :gender, :latitude, :longitude)
	end
end
