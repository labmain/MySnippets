-- 数组A包含数组B，取出不包含数组B的A数组的元素
select * from collect where fileID = 'A' or fileID = 'B'
group by wordid
having fileID = 'A' -- 在结果里再次筛选
