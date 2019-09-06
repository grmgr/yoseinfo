class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :caption
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end

      # 外部キーとして使用する
      # references型はカラム名+"_id"がテーブル名として設定
