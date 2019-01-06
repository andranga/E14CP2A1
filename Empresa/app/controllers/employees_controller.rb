class EmployeesController < ApplicationController
	def create
	    @employee = Employee.new(employee_params)
	    @employee.save
	    redirect_to companies_path
    end

    def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy
      respond_to do |format|
      	format.html { redirect_to company_path, notice: 'Employee was successfully destroyed.' }
    	end
  	end

	private
	def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :company_id)
    end
end
