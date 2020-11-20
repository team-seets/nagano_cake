class AddIsDeletedToCustomers < ActiveRecord::Migration[5.2]
  def change
   change_column_default :customers, :is_deleted, :boolean,　default: false
  end
end
