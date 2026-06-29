import random 
cards = ['SSR','SR','R','N'] 
card = random.choice(cards) 
if card == 'N' : pass    
else : 
 print('Congratulations!') 
print(f'You have obtained an {card} card.') # 共通の処理