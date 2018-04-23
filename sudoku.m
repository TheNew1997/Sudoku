function sudoku()

    figure;hold on;axis off;axis equal % nastaveni vykreslovani
    rectangle('Position',[0 0 4 4],'LineWidth',3,'Clipping','off') % nejsilnejsi okraje
    rectangle('Position',[2,0,2,4],'LineWidth',2) % silan cara vertical |||
    rectangle('Position',[0,2,4,2],'LineWidth',2) % silna cara horizontal ---
    rectangle('Position',[0,0,4,3],'LineWidth',1) % horni tenka cara
    rectangle('Position',[0,0,4,1],'LineWidth',1) % spodni tenka cara
    rectangle('Position',[0,0,1,4],'LineWidth',1) % leva tenka cara
    rectangle('Position',[0,0,3,4],'LineWidth',1) % prava tenka cara

    % A je yadani sudoka, kde je nula tak se musi doplnit spravny vysledek
    B = [3,4,1,0;
         0,2,0,0;
         0,0,2,0;
         0,1,4,3;
        ];

    C = [0,0,1,0;
         4,0,0,0;
         0,0,0,2;
         0,3,0,0;
        ];

    D = [0,0,4,0;
         4,0,3,0;
         0,4,0,3;
         0,1,0,0;
        ];

    A = [1,2,0,4;
         4,0,0,0;
         2,0,0,0;
         3,1,0,0;
        ];


    znova = 1;

    while (znova == 1)
        znova = 0;
        for x = 1:4 % cyklus pro radky
            for y = 1:4 % cyklus pro sloupce
                if (A(y, x) > 0) % podminka jestli na pozici v poli neni 0
                    text(x-0.5,4.5-y,num2str(A(y,x))) % vypise do daneho policka cislo ze zadani
                else
                    number = 0;
                    pocet = 0;
                    if (y > 2)
                        umistenix = 2;
                    else
                        umistenix = 0; 
                    end
                    if (x > 2)
                        umisteniy = 2;
                    else
                        umisteniy = 0;
                    end
                    for n = 1:4 % cyklus ktery zkousi vsechny mozny cisla
                        neni = 0;
                        for t = 1:4 % cyklus ktery slouyi pro kontrolu jestli v radku a sloupci neni uz zkousejici cislo
                            % podminka ktera bude hlidat zda neni v radku a sloupci dane cislo
                            if ((A(t, x) ~= n) && (A(y, t) ~= n))
                                neni = neni + 1;
                            end
                            % kontroly zda neni cislo ve ctverci
                            if (t == 1)
                                if (A(1+umistenix, 1+umisteniy) ~= n)
                                    neni = neni + 1;
                                end 
                            end
                            if (t == 2)
                                if (A(1+umistenix, 2+umisteniy) ~= n)
                                    neni = neni + 1;
                                end 
                            end
                            if (t == 3)
                                if (A(2+umistenix, 1+umisteniy) ~= n)
                                    neni = neni + 1;
                                end 
                            end
                            if (t == 4)
                                if (A(2+umistenix, 2+umisteniy) ~= n)
                                    neni = neni + 1;
                                end 
                            end
                        end
                        if (neni == 8)
                            number = n;
                            pocet = pocet + 1;
                        end
                    end
                    if (pocet == 1)
                        text(x-0.5,4.5-y,num2str(number)) % zde se bude vypisovat cislo ktere na dane pozice muze byt
                        A(y, x) = number;
                    else
                        if (pocet > 1)
                            znova = 1;
                        end
                    end
                end
            end
        end
    end
    
end