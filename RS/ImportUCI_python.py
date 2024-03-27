from ucimlrepo import fetch_ucirepo 
  
# fetch dataset 
rice_cammeo_and_osmancik = fetch_ucirepo(id=545) 
  
# data (as pandas dataframes) 
X = rice_cammeo_and_osmancik.data.features 
y = rice_cammeo_and_osmancik.data.targets 
  
# metadata 
print(rice_cammeo_and_osmancik.metadata) 
  
# variable information 
print(rice_cammeo_and_osmancik.variables) 
import matplotlib.pyplot as plt

# 假設`type`列表示稻米類型，`length`和`width`表示稻米的長度和寬度
cammeo =X[X['type'] == 'Cammeo']
osmancik = X[X['type'] == 'Osmancik']

plt.figure(figsize=(10, 6))

# 繪製Cammeo稻米的散點圖
plt.scatter(cammeo['length'], cammeo['width'], color='blue', label='Cammeo', alpha=0.5)

# 繪製Osmancik稻米的散點圖
plt.scatter(osmancik['length'], osmancik['width'], color='red', label='Osmancik', alpha=0.5)

plt.title('Comparison of Rice Length and Width by Type')
plt.xlabel('Length')
plt.ylabel('Width')
plt.legend()
plt.show()
