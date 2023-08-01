ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
FLUSH PRIVILEGES;

create database store_group2;
use store_group2;
create table category
(
    id   int primary key auto_increment not null,
    name varchar(60)                    not null
);
insert into category(name)
values ('dell');

create table products
(
    id          int primary key auto_increment not null,
    name        varchar(255)                   not null,
    price   float                          not null,
    quantity    int default 0,
    idCategory  int                            not null,
    image text ,
    FOREIGN KEY (idCategory) REFERENCES category (id)
);
insert into products(name, price, quantity, idCategory , image)
values ('dell', 1000, 20, 1 , 'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
select *
from products;



create table users
(
    id       int primary key auto_increment not null,
    username varchar(18)                    not null,
    password varchar(18)                    not null,
    role     varchar(18)                    not null,
    name     varchar(60)                    not null,
    age      int                            not null,
    address  varchar(255)                   not null,
    image text
);
insert into users(username, password, role, name, age, address , image)
values ('team2', '1', 'admin', 'nguyen ba son', 24, 'hai duong', 'data:image/jpeg;base64,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');
insert into users(username, password, role, name, age, address , image)
values ('linh', '1', 'user', 'linh lee', 24, 'ha nam' , 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUTExMWFhMXGBobFhcRFRcXGhoaIBsYGBsaFRgYHSggGB4lHRkZITIhJSkrLi4uGh8zODMsOiotLisBCgoKDg0OGxAQGy8mICYyLS0tLS0tLS0tLy8tLS0tLS0tLS01LS0tLy4tLS0vLS0tLS8tLS0tLS8tLS0tLS0tLf/AABEIASsAqAMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABQYDBAcCAf/EAEcQAAIBAgQEAwQGBgkBCQEAAAECAwARBBIhMQUGE0EiUWEycYGRByNCUnKhFDNigpKxJENTY3Oys8HwojQ1ZHSDo8LR4Rb/xAAaAQEAAgMBAAAAAAAAAAAAAAAAAwQCBQYB/8QAMxEAAQMBBgMHBAICAwAAAAAAAQACAxEEEiExQVFhcfAFE4GRobHRIjLB4SNSBhRygvH/2gAMAwEAAhEDEQA/AO40pSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUpSiJSlKIlKUoiUrDiZ0jUu7KqjdmIAHvJqvYzm2MaRRtIfNrxp8yC3xC2rJjHPNGiqjkljiFXkDmrPSqJNzNiG2KoP7tbkfFyQfkK1X4tiDvO/wyr/AJQKstsUp2HXCqou7Ws7cqnkPmi6LSuf4FcbLH1YmlZbkC8oBaxKnKrG24O9qww8dxO4nk3IIdYjYgkEG6XBBBB17Vi2zOdg1wPj+lm/tBjADIxwB1IHPQ7Lo1KpEPNeIX2kjkH70Z/i8QPyFSuE5rhbwuHjPm65l/iW9h6tasH2eVubfypYrbBIaNdjxw96KxUrFBMrqGRgynZlIIPuI3rLUKtJSlKIlKUoiUpSiJSlKIozjXFo8LH1JLm5yqq2zM1ibLew2BOvYGoThnOySSBJI+kGNlfOGF+wfQZb7X1qp8y8Ykxcg1yxRu2RLDUC6EuTrmOugsBtrYkxaMGFxqDpr8iCKqSWgh305BXI7OC36s126oLjfH1g8CDPNb2b6KPOQ9vQbn0GorXC+bHEHR1M66I5Fx0/vsTuy+zbv4SdzUaBvqSSSSSbkk7lidz61tbJZ++Aeft9+tVou0bd/rExt+70HzXTzWXF4h5WzysXYbZtAv4F2X+fmTXrAYcSyrEZBGCrOzm1wq5QcubTN4hqbgAHQ14fDSiNJyiiGQgKS/jNwSrZMtsht96+o0rBPl0zDMSQFULmJbsEXcn3VsatdGRGacdut/daQiRkzXTtLicaHM7b66LK4QSSdJ2eLN9Wz2uVyi5BAF1zZrHvvqLV8JtUvguWpGXqYqQQRgXKKVzgf3spuq+oW9vvV9TE8Oi/U4U4gjTqEdT4iXENdh6qTVY22OMUGPHL9+ivR9kT2h5dQNrjQAmngMvP9QKYxUuFnyAnURzsgJ8yFYC/rvXuHLbw2t6a1ZxzPbQYYW8uoAfkEt+daz8RwMp+vwRjP9p0kbfyeEl195AqJvaMdaho8/0rcnYFougFzqDKoJA9TRQGIzZWye1Y5fxW03rex+HgWJZYcQXGZFeKUr1AWIXQABlYE3KkHQG1u8lJyuroJMFOGQjwrK5kQ+izC7jXu2f3VBOhVykiFJV3VwMwHYqRoynzBtv3BFWWyCZwLHEEabrWPs7rKxwljDgddjzpUeWO5yWTDyPG2aJ2jY7lO/4lPhb4g1Z+E81BiEnARjoJFv0yewa/6sn1JB01uQKqjE6BVLMSFVRa5YkADXQanc6CvssbKzRyIUce0j2Oh2IIuGU66jyI3BAymhikN04OzWFmtU8DbwxZljl4bew1C6nVD5i5tkEpjw7AIhId7BizDcLfQKNQTa5PlbWOPMcsERw4JJcfVPfWMaBwSTc2BGQ62J10AqvMwRfIDy+QAH5WrQ2tzond3qutsVy0MEoy6rXkV0TlLmVsSzRShRIq5gyAgMtwDcEmxBK+hv2q1VxCFzG4mVmSQDRgdVG9hbQ37jUGwBuK7Lw+R2ijaRcshRS6+TEAkfA15BJfbjmFnPHcdhkVtUpSp1AobmLjyYRVLKXdyQiKQL2tcknZRcXOu40rm+I45PiH65kdCTdFjkYBB2AtYHTcka99NBLc/Y9XxiRC/wBVG1z2zMUYgfu5D8fSqvgBaNB5C3y0NUbRI6paFds8baBxVk43wstBDjlH61EbEKosA7KPrFHYEnxDzIP3jVafwOD2Y2b8Wyn4+z/D5V1flZVkwECMAy9IRsDsco6bA/IiuZ8X4eY3lgJ8SEqGO/Zkb32Kn317OylH75pBJWrdsljMmQq/3Tr+E6N+WvvUVMSJmBU7EEG3rpULEwdQbaMNveKkMFigYlJDGyIzlUZgna8jKCEFwdTbYnsa2fZE1GvjJyx8+h5laD/IbMXPjkYKkgg+GI9KrexuPldV67pkiXQImRQAti7As12y3GlgATpVj4Jw9MLE2LxAtJlvYi5jQ2sigbu2l7akkKL2FQ3BcJ1cTEh9lbyMPMKVsP42T4A1Kc44vPKkA9lFEj+rElYx8Arm3mUNS214iHdtwAxPNe9kQOtMnfSGrjgDsBnw3HgdyobimPeZupPcKCOnCPEFJNl8I/WSk2F9dTZd9c8/DMRGgkki8JFyEbO8Y/vFA8rXKlra9hmPzheISHELLKhdAtlKgkxsbgvl+3dTl01AvYHMbdAw86uodGDKwurKQQR5gjetYxgeKuzXSzzus7gyNtAN9evPlkubqwIBBuDqCNQR6V9W5YIoLOfZVRdj8PLbU6DuatPFOV0kbPE3RJN3CqGVr7kKSAr/ALW2pJVqk+F8Kiw4tGup9pmN2Y+bN392w7AV4IDXE4LN/aTbv0jHjp8qkxmbCzXC9KQjMUYgpKug8WW4JGgzDxKbbg+Ky4mCLiGHDr4JBfIxF2if7SuAdRsCL2YWIPsmvXN/S6H1htJe8NtWMljYKO4IuD5KSSRa4h+VsV08Rl2WYWI/bUFgf4QwJ72XyqRpMbwAcNOCqytFphdIRiM8MHD5GqgbPsQY5Y3FxvkkQhh+IXAI7MCOxrZx/EJcTIryRxoUQqem5bPdgQSCoygWNhc+2ddLmX5zwgSaOUbSAo34l8Sn3lc4Poi+VVjiWLVEbxKHKkoCwBLAaZQd9SK3sZZI0SuzHRXFTtlge+zMxDqUHt6570qo8yZ3d+xOVfwqSPzOZvcRWEeJ79k29W7n4A2+J8q9taNPRF/ID/8AKYSBrIi6yMQo8i7G1z6Zmv7q5WSQyvLzmT15LuYYmwRtjGTR0fE1PNWrkjggmf8ASJBeOJvqwdmkH2vUIdv2vIrUEvGcSX64nk6p8Vs7dPzydO+XJ2ta/e99a6phMMmGgCL7Eabn0FyT6nUn31x6A2Rb9lF/lrU0o7trQFFCe9c4uXSuWObExhydMxvkzgEhgy6Xs2mozLcEDcWvrb7VF5JxghxGFDD2lyE+Vwqj3+IqPjftSp4nX21coJWXHUanO0ZTGysf7RG96NGqX9wa/wDAajIDYsvkcw9za/5s35VevpH4TmVcSBcKuSYf3ZOjH0Uk+4Ox7Vz4Ztv6xNr/AG19/rpfyYDta9SZtHHz68VbhfVg4dey6J9HXERkfDE+JSXQeaMbtbzs5N/xrUb9IEAXFIw/rIhf3oxF/k6j4VWcJiSCskbMjqdCNGU+RB02OxuCD3BrYxvEp8SwkxBTMFyqIwQALk3Nzqx72sNBp55GUGK6c14IiJbwyWjhGtGD2y3+FT3KXF1gwckbxszTJmjyqWVsyZMjsNEAte7WFm0udKrmLuQsMftNYD0HmfQAX+FWKCIIqqNlAA9wFhV/s2zd6Hl2WC1HbNuNndG1lL2Jx209fZWHkKC0kpJvljiUH4yZj8cq/Ko/ij5sTiD/AHgA9yxxr/MH51JclS2mmQ90Qr+6zhvlnT51o8bhyYmcH7RWQfhZQv8AmR/lXvaNb7uas/46W3Gf8T51x/K03YAEk2A1JOgA9asXJuBlTNK10iceGI7k3H1rA+wSO25Bu2tgIzlvDxSYi0xF1sYY22cgXL+TFTsva2bXQi74rEpGhd2CoouSdhVaGOn1FbG32kuJiAyzr+PnXlnnrXxvU6b9LL1cpydS+XNbTNbW1/KqXjOcJS+ZDHHGPZSb2pB3LkH6v0ABI3PdRaOCcXjxKZ0Oo9pSQSp+GhB7MND86lDgclSkhewAuFK9Y7eKonUZ3Z5Cxmvlk6tsykfYsNFGxAXQ3B1vc5sO5WWEjfrRD5uqn8iamedYYlKSBgMQxChRvIl/FmA2CA5gx22+1UVwiEyYuBBspaVvwoLD49R4/kfKq5ZSQLatna+yuNKUBHDHDDzU9z5+qh/xx/py1UZcREuExasyCZ5cPlDEBmizQABb7gP1dBsT61Y+e57th4e93lPuVemL+8y3/dNVjGQB0ZdBdWAJ7Hsfga3EUBls5bXUn0+VxdptbbPbg+laNAPmT7eahcZ7B9SoPuLAH8qkOEYrp4zCnS3WAN/2g0Q+OaRT8K0Y3EiX7HceR7j4GvmIRiY3QgSRSJImYXUlWDWa3Y2rnoyGuF7Tr3XWyAuYbuvXsun88cREWGaO/jmBRR3sdHb0spOvmVHeuX43Vcndzl+H2j/Df42rZxuNeRjLO5aQixO4A7KgAFhc7Aa+prQlly+I2DkWUHXIvcn17+pAHa9ZySX3VGSwijuNoVIcEjMmKiA/towP3XDuR8FP8FfasH0ZcLLscSQRGgMcAO5O0kh9RbLfzL0qzAwBuKqzyVdguiSRggggEEWIOoI8iO9cv5r5XOHJdQWw4N1YXzQ+jHfL5PtbRvNuqUqR7A8UKwY8sNQuIxg21N/W1v5VrYvHqmgILHb/AJ/tXVeIcl4KY3aErfU9GSSIE+ojYA/KofmDk/CxYa8MIGVgXYlmcp7JvIxLWW4ffTJeoGWSrgC5Ty2y6wuDSSNPjjsqDwRnjLSOmYv3U2YL5AHQjvuD79AJWLH9VZFCskgD2VrAkahXUg21/LvWvNhnS4Do3l1HCN8dLH36VF4nD4lHWZ4mRACA+lgSVsLb2NvatY6C+tq2VnktMD2wygBpw0Ge2OOO4qtHa4bFa432iFxL6VOZy3GNMNjd2V4lx2Hw+JhlwrZkyN1kDF2RbopBUksrG5YqdSYdrk1ZuYeHfpCJNCQzqLrYi0iNYlQ22tgVO1xuASa5thOJTSDwQ59L5r5VPlcka/C/8ql8E2IQFeuVjNz04QVW53OY3Ye5So1JIJrC1dyxtL1T14equ9mMtkjy8R3W5g5CtMdiQeA1xzqMOLlLExoLyA+LPdek2hBce0GGjACx2NxvWxiYTKAszyShdQJXZhf7xW+W/rbS+le0QAWH/CdSSe5J1vWLFYtIxdjb071q7xGS6vuw7FwBPL2XqPDoosEUDyCgD5CvkERjkEsLGOQX1X2TfUh09lgT8fUGtFONp9pXUfeaNwvxYrYVIxyBgCpBB2INxXgcRiFk5jHi6aELTWcqzNiGvK9rzHXqW2UD7G5tGNNTa+tXnljhvQRppfDJIAWzH2I1uVUnYHUsfViNbA1U5EDCxFx6/MfnWDij4p4ulHOelu0ct2LW2XqG7BfNTe9hsLgzRObeq4+Ko22GUx3YhUDTInhjh1qtnGYo4qdpBYdSyxmTQLEuYgv5Xu720PiVd6rnMGPyyPBE/VW4GYLkLNa7IBfRRvc+o7axuKkkzjqGRJADa5s1jobEGxHurHBgpna8EbPlUhwuXQNbW7EAnQ6Xua3UshjiL2EXQMMRQk6nRcXDC2WYMmab5dV2BqAMQAM6UoMRx2K314TPGiTaIrkXVhckFWsWFxl1Ci4vfMPK1YX4ooNrXPv/ADHpX3G8XxEkXQkXpmwBzKEO4ucosSbqGFzuauX0bcswvh5ZJ4lkErADqqG0S4zC48JzMw0+6K1k1nfL/K+grtr0NVubNaWRAQMqacch666c9lRp+IsRYeH1Gp/MW/KpXlHlOXGsHbMuHvdpWvd/SIn2vLNsO2otXToOTcAjZhhYyRtnBe3uDkgVPComQAZqy+cnJYcJhkiRY41CogCqq6AAaAClZ6VYVdKUpRErFNCrqyMLqwIYHuCLEH4VlpRFyKSGTCTMADmU5SwFyw85EGpDCzBlvYkjsb5+I8RM8YjaEqjOofOR4hmWwQb2LWBzBdL2q7cz8G6y9SMfXINO2ddyh/mD2PoTVHkKuMpv4lPmCACL/hYH4gj0qWOwQTkyY3+eFd988edVQn7StFkLI6AxgihpjdGbc7tQBQGlaUJ1K3KxTzqgLMwUDua1sMZHdYzIouSCwTxaJ1BuctyPS3p2r3xNMLhFaadyRGFZ5ZR1HuxYRpDHomclW1tZQtzvWskjfHJ3RH1bfvJdUztOCWPvYySOVPf/AM40xWpHxB8R/wBmAK7GTUi/7IHtfMD1rcwPLrA5nIL/AH3sW/dA9kf8N60eXOasDj5unh+quJsSi4pIkMoAJKxyw2KNYd9P9rhDIGVWXYgEe4i4qtaGyMwOR66wWAtfe5ddeK0RwdPvNf4f/VaE/LtiWiYq3mnhv+Iaq37wqwV4mkyqTYm3Ybk9gPUnSqzSQfpS+7dVWXHNAQuIAAJsHGnuzKdvK4JHu7bsGKRxmR1YeakGobjnOnDsJM8EvVeVTaU4OKEord1zynNIy7E6D3bDcThUOJRcRCc8cgzIyF42NiUYMoOjqRlO/bXWwvubJG288eXX5WcNta43T14/NFi4yySAIQGAN/cdtD2PqKw8ucejwySxurkB2KsozFtFFmGmotlB8l1NReOlljcxhhbYMyeK4AJ2IFxmHbc7Vq4WEsyxoCzmwVRqzEk/mTc395q/ZrF3zCZftNCMdc666HXdaztbtWJpayAVeCQSW6atrr9W1RUBWOTEtxGVYIwbk6BlIWJBbPKxYDMwB0sLXKjS5J63gMGkMaRRiyIoVR6AW18z61C8n8uDBxeKxmexkYfkin7q3+Jue9hY6MiZFVsdacVAZHyAGQAHh0T1gAlKUrJeJSlKIlKUoiUpSiLT4nj0gieaQ2RBc21PoAO5JsAO5Irl/NfGcM80cuGu+Yh5gBbIblD4TqHK57r6Ke+tp+lKQjCIvZpkDe4B5B/1Ip+FczwHD5naTLC5GYWZlyLbImuZ7AgG+1zXnfGI3gaLCSFszbjhVWHh0gbFRMpurZWBH+Higf8Ab5VKcy8CTFxvFIrNHIEzdMgOjIWKSR5vCfbYMptcEWNxYwHAcGyTQvHLFMZXYZIWBUMsMj5VcnVmXMbnKPCvmTVwwmMWQsAGBU2IdSttSLG+x0Ph3GlwLiqdttBfK2dm1PGpqCpuz7N3MLoXb18KCh/HgqPyp9HkeDxC4hZpJ5Uv0s8HQjRiCM8l3ZpLXuFWwJAubVfIociBF+yoVSddhYE+dZK0sR1Uzsio41YKzMhvb2QQrA3I9LXqjLM6b7lfZGI8lQZMPxsS5c7s33laLIR52Ow9Mt/SuidJmjCu3jyi7ILWYW8Sg+Tai/pVCh5s4kQMX+hRfoxS/TWT67J7WYN301tl+FXWISSFGdURRZgAxd9tr5QF313vqPWp7VI91281raf1AGPGmvQWEcdyuLjX+1fyqhx36O8PiZ3ndcRHJIxaQYYwtGzHUsnVZWjzHUqcwBJAJq28E4YuHijiRckca5Y1LZiASWZnawu7sbmwAFgBtcyNR8/EruIYVMszbKg8I9oZnbYAFbHe1xcaio32iWUXPZethYw3vdV7FwrJiHzbWk/1FW//ALQqzfRty10Y/wBJlH10tygI9iM+z7mZQCfLbzvWRg2EssTNd8rRlgLXZppluB7zXYEUAADYbV0cpLIY2cB6AD8Lm7E2/PNIf7GnmSfwvVKUqotolKUoiUpSiJSlKIlKUoig+bcDNNh/6Pl66Mrx59ri6sPK5RnAvpci9UHhkMuIjcYmbW7LIjlVkQWsUlVLKp1PwKnXeutVV+eMHC0Od4Y3kzRqjOisw8ak5WIuPCGPwqGSzd8QBgajHx/azbaDA0uOQBw8K/hUzhiYaKaGSDERyGKRnYTSBc943iGV1GWyhn2Ug3Oul6tsuPw2IOd45Ee36yEhj6awsxdfRlt6VF8jQ58XI32UU/MkRr+aTirni+EYeX9bBE/+JGjfzFZyWd0Tiy9UcR+1DZrSJ4xIW05HbwXOeYOYGw0qxwhpltq08bRa72VgoDWGpOUbga621IOeL2DYex1taS97FQbeAeZ/hbyqtSSvJPMRfIXIhjViUALsq9MXygEBLWAuLE71Z5OViuEEqkGUusQ03yn6xlv6iQWO6qL3ub+WmzWaGNokADiHOJBNA1utDxIFKAVrTIlZwzyvkddNWigxpmePWizRIpj6SkWPgW39mfZYf+kc3wNYOI89LGxVYGfUgNnULsGGlidVINvf5GtJeG4rpALHlVyUzEMRYljYZ1uEJF8nUy67EXBy8d5WKQwYlBdnGZ0XW5CMSNdWexYk7/V2F71A2KG+BMcBdriR9JNLxOGApU7AFWp7TI9n8YxxHMgZfjnRWfk+QcRiaRpGTK5Vo4hl03F3YFtR5BSCGHa9XLhnC4cOuSGNUHew1PqzHVj6kmuS/R9xEYfFuwl8Ems0Z26eRck0Zt4srhgw7K5auzBr6jUelXHxRxSOYwUoada8s1UbI97Gucc8etFzKZP6aW/8XGPligf/AJ10+uY8W4dIy5kEjyPHLNMVZQEkDqVMYzBlKkG1vujvqbzwJz02UsWySOoLEsSt80d2OrHIyC51NqmmcHBhG1PJVLLE6N0gdq4kcj8a6VyqpWlKVAriUpSiJSlKIlKUoiUpSiJVc5xwE0qRdFM5STMyhlU2KOlwWIGmba+xPlarHSsmuLXBw0WEjBI0sdkcFDct8LOHis9uq5zPl2HYKpO4A0vpc3Nhe1Rf0jcTMOE6amzznp6bhLEyH08Iy37FhVtrln0oTs+MiiUXZYlyDzeWQoF95MaD41LA3vJhe5nwxKjl/jiowZCg9lA8pYe8s8xF1g0X1cxg/kp/6x5V0Ti8fTGFg3yIzk/tKEjuff1XNV/lzhyxrDCDcyT3J+/Z2kYn8UcRqd5ll/pLfsQKR+80t/8AIPlXO2+1OnjtVoOpuN4NBp63iea2VmhERijGmJ59CnJe8V/3bhj/AOWPzKX/AJmvCoZMFKF1eGRnW29wetlH4kcp7mra4sluHxDy/Rf9SIV65Xfxzp2Ijf4kMh/KNatShv8AvCN2TmEEf9j+KrBte5LhoQfQLkXEeGvDiJLHLGbNh5EOq7uLeWXOQPMKd9av/I/MbLGiz2CEbj2UbMUJW+0RcFbf1baaqVI0uKcLzoYNmVmjS/Z1JOHJP7S2j905rU5Wyvgpyw/VSrIMw2jkVFlVgd1Kq5IPex3Aq7BKZ7G0k1kiNx3GlRjzpUaitdSqzm93aCB9rxeHA9eaueM4LKzMvThePNIUaSaZCFkIeRJI0W0ilwdC1iLaVK8HwTxK3UdWd2zMY0MaDwqiqilmIAVFG+pudL2FdwOLlwg1keXDrustmeNB3jcDM4UAmz5mPY9jcVYEXGoO1qRTNkFWqR8bmGhXulKVIsEpSlESlKURKUpREpSlESlKURKoPMkGTiYnIuVwUkkIIJUyxF/bt2AlU++3e179VO5/wbmMSJI6KQ0MwTLZo5LKL5gftWFxY+M614X3AXcCvWx944N3IWpwqF1mi6cZlWBCWGZVclgY1KhrKTbqXuVrV5g4kWkxJMUqsI1jysFJzBGcDwMw/rV796i8PxDExMzxT2dgqnqRIwsCxGi5dfEe9a+OxM8plMixSmQW8dlAOXLcARnX41zxaP8AREJxdWruP1VNCcOVVtjZZhPfu4aZbK78xY5P0XLlkGUwk5opFACyxljdlA0AJrV4JxSFMSwMiaxbA5mYhtlVbk2ub/iFQeL480kbIMBhY8wsWSc3A72H6MNxcb19wnHJkkEixxAhWUDMzjxFTf2V+7VueRjrXHK01AvVO1Rhhmc9FEyxziJzC3bb5W1zFjLyTdGGYs4SQMY+llcDKrfXFSbdJToDtW3yTgR1+IowzxSOpGZSoZJRJPYKewWbJ+6dthX+L8WxEpaSSVV8IW0MYW4Baw+sLm5zGrb9GsL/AKJ1ZGZmlYlS5uemv1aAfs2UsPxVYsT6Sy3ftdQ5HhWviBRQWqzuYxhfmKjTj+1Q+ccDNFP0cQxeK31F75XQWuXGzyDQNfbQgDNr0/kyQtgcMTqekoue9hlB+IFbnFOFw4lDHMgdd9bgg+asNVOp1BB1rPhMMkSJHGoVEUKqjYKBYD5Vda0NyVUknErYpSlZLxKUpREpSlESlKURKUpREpSlEStPiWDWaKSJvZkVlNtxcWuPIje9blKIuPRFsoze0NGt94aMPmDXqvXFz0J5Ul+rJkldc+gKNI5Vg2xuD53rBhOFzYmYJh331dibpGv3jbe9tF3J8gCRojC7vCwDenXJdQ20s7oSOIyFcetdFlpVubkVOllGIl6v9oQhF/VMtsvpe/rXN+P4ebCyGLEnKd1ObwOv3kJtceY3HfsTnJZJGCpUUVvikNBnxos+MviJI8PEfEzhQR2JNr+uUEt8K7Vg8KsUaRILIiqqgdlUAAfIVyL6NIBNjldbMsKO5ZTcByBGqkjuRI5t+zXZav2OO6zmtV2hLfkpt18JSlKtqilKUoiUpSiJSlKIlKUoiUpSiJSlKIlRmN41BE2R5B1LXKIGdwOxKICQPUi1RfPvHzg8MChAllbpxs2ykgsWN9NFUkA7mwrjqoJGz3JsxIa5zFtmcv7RN7i9/M+VYudRF0Xj2JjxBxMq5gUjCqXjeM+FGcWDgEjM7emh8qvHDOHxwRrHEiqqgDwgC9gFubbmwGtcu4FxhZEfDYp1bTwmQi7odCp7swNtRqbr3BJ6TwCaR4EMgYN4h9YpVioYqrMpsQWUKxBAOuw2qtZ6333hjhy81PLS42hwx91KVXOc8GkkcWYezKLGwuLq66fxD5VY6rPNGKAkhjfwpqwLaBpBoFzbXALNl3OhHsmppzSN3IqOL7wtLljiGGwzzQvPGrFke0jqurLltqd7INPUedXOuGcV4xLiC2WV44jfIIWKG3ZmYakne22trHcyv0d8wPBKmHdiYXbJlYk5JD7LIWJIViQCv7QOljfCC8GBruuvFeykF5IXXqUpVhRpSlKIlKUoiUpSiJSlKIlKUoiUpSiLHLGrCzAEeTC4+RqG/wD5DA3v+ixe7L4f4dvyqdpRFp4LhkMItFDHH/hoq/yFblKURKw4iBZFKOqshFirgMCPIg6Gs1KIqvPyFgGNxCU9IpZUX4IrZR8BW9w3ljBwAdPDpmBuHcdR7+fUe7X089KmqURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpRF/9k=');
create table oder
(
    id     int primary key auto_increment not null,
    time   DATETIME                       not null,
    userId int                            not null,
    FOREIGN KEY (userId) REFERENCES users (id)
);
insert into oder(time, userId)
values ('2023-07-21 ' , 2);

create table oderDetail (
                            id  int primary key auto_increment not null,
                            priceProduct float not null ,
                            quantity int not null default 1,
                            idProduct int not null ,
                            idOder int not null ,
                            FOREIGN KEY (idProduct) REFERENCES products (id),
                            FOREIGN KEY (idOder) REFERENCES oder (id)
);
insert into oderdetail( priceProduct, quantity, idProduct, idOder)
values (1000 , 3 , 1 , 1);

