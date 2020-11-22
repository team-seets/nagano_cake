class EndUser < ApplicationRecord

  # # ステータス: active (本登録), resign (退会).
  # enum is_deleted: {"有効": false, "退会済み": true}

  # customer = Customer.active.first!

  # # status を確認.
  # customer.status # => "active"

  # # status を 2 (resign) に変更!
  # customer.resign!

  # # status の取る値を確認.
  # Customer.statuses # => {"active"=>1, "resign"=>2}

end
