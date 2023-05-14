class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 1, sales_status: '---' },
    { id: 2, sales_status: '新品' },
    { id: 3, sales_status: '未使用' },
    { id: 4, sales_status: '未使用に近い' },
    { id: 5, sales_status: '目立った傷や汚れなし' },
    { id: 6, sales_status: '傷や汚れあり' },
    { id: 7, sales_status: '全体的に状態が悪い' }
  ]
end
