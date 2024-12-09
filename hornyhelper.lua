---@diagnostic disable: undefined-global, need-check-nil, lowercase-global, cast-local-type, unused-local

script_name("Horny Helper")
script_description('Cross-platform script helper for Families')
script_author("KynuCJ10HA")
script_version("2.0 Beta")
local ffi = require('ffi')
local sampev = require('samp.events')

-- Цвета сообщений
local welcome_color = 0xFFff00ff
local err_color = 0xFFff0000
local success_color = 0xFF00ff00

id = nil

-- Список всех сообщений, которые нужно отправить
local marketing_messages = {
    "/fam Привет, в нашей семье есть возможность покупки рангов",
    "/fam [2]Огузок - 1.OOO.OOO$",
    "/fam [3]Скромник - 1.5OO.OOO$",
    "/fam [4]Пупсик - 2.OOO.OOO$",
    "/fam [5]Водитель велосипеда - 3.5OO.OOO$",
    "/fam [6]Кайфуша - 4.OOO.OOO$",
    "/fam [7]Спортик - 5.5OO.OOO$",
    "/fam [8]Оператор качалки - 6.0OO.OOO$",
    "/fam [9]Блатной - Установка Фамилии Horny",
    "/fam Опплатить ранг можно в разделе /fammenu -> Семейная квартира",
    "/fam [5] Положить деньги на склад семьи",
    "/fam Не забудь сделать скриншот с time (/time + F8)",
    "/fam отправлять в ТГ: @KynuCJ10HA",
    "/fam Замки не выдаём!!!",
    "/fam Неактив - 30 дней (автокик)",
    "/fam ранги после неактива/ухода из семьи не восстанавливаем",
    "/fam Наш дискорд: https://discord.gg/cTRWq99XQ9"
}

function isNumber(value)
    return type(value) == "number"
end

function tonum(str)
local num = tonumber(str)
    return num
end

-- Функция для получения имени игрока по ID
function getname(id)
    return sampGetPlayerNickname(id)
end

-- Функция для разбиения строки напараметры
function cutParam(input)
    local parts = {}
    for word in string.gmatch(input, "%S+") do
        table.insert(parts, word)
    end
    
    if #parts < 3 then
        local id = parts[1]
        local r = table.concat(parts, " ", 2)
        return id, r
    elseif #parts < 2 then
        return input
    else
        local id = parts[1]
        local t = parts[2]
        local r = table.concat(parts, " ", 3)
        return id, t, r
    end
end

-- Функция для отправки чата и выполнения действий
function playrp(messages)
    lua_thread.create(function()
        isActiveCommand = true
        -- Отправляем все сообщения с паузами
        for _, message in ipairs(messages) do
            sampSendChat(message)
            wait(1000)
        end
        -- Завершаем команду после отправки всех сообщений
        isActiveCommand = false
    end)
end

-- Основная функция для инициализации хелпера
function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(0) end
    welcome_message()
    commands()
end

-- Функция для приветственного сообщения
function welcome_message()
    if not sampIsLocalPlayerSpawned() then
        sampAddChatMessage('{ff00ff}[Horny Helper 2.0 by {00ff00}Kynu{ff0000}CJIoHa{ff00ff}]{ffffff}: Инициализация хелпера прошла успешно!', welcome_color)
        sampAddChatMessage('{ff00ff}[Horny Helper 2.0 by {00ff00}Kynu{ff0000}CJIoHa{ff00ff}]{ffffff}: Для полной загрузки хелпера сначало заспавнитесь (войдите на сервер)', welcome_color)
        repeat wait(0) until sampIsLocalPlayerSpawned()
    end
    sampAddChatMessage('{ff00ff}[Horny Helper 2.0 by {00ff00}Kynu{ff0000}CJIoHa{ff00ff}]{ffffff}: Загрузка хелпера прошла успешно!', welcome_color)
end

-- Функция для регистрации команд
function commands()
    -- Рекламное сообщение marketing_messages
    sampRegisterChatCommand("frek", function()
        if not isActiveCommand then
            playrp(marketing_messages)
        else
            sampAddChatMessage('{ff00ff}[Horny Helper 2.0 by {00ff00}Kynu{ff0000}CJIoHa{ff00ff}]{ff0000}: Команда уже активна, подождите завершения текущей!', err_color)
        end
    end)

    sampRegisterChatCommand("fi", function(arg)
        local id = cutParam(arg)
        if not isActiveCommand then
            local invite_rp = {
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/me засунул руку в карман, затем достал книгу, потом перо",
                "/do В записной книге написаны все участники Horny Squad.",
                "/me ручкой небрежно черканул на странице с участниками семьи",
                "/do На странице добавлен новый участник: " .. getname(id) ..".",
                "/me закрыл записную книгу и положил в карман рубашки",
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/faminvite " .. id
            }
                playrp(invite_rp)
        end
    end)

    sampRegisterChatCommand("fu", function(arg)
        local id = cutParam(arg)
        if not isActiveCommand then
            local invite_rp = {
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/me засунул руку в карман, затем достал книгу, потом перо",
                "/do В записной книге написаны все участники Horny Squad.",
                "/me ручкой небрежно вычеркнул " .. getname(id) .. " с участников семьи",
                "/do На странице зачёркнут участник: " .. getname(id) ..".",
                "/me закрыл записную книгу и положил в карман рубашки",
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/famuninvite " .. id
            }
                playrp(invite_rp)
        end
    end)

    sampRegisterChatCommand("fw", function(arg)
        local id, reason = cutParam(arg)
        if not isActiveCommand then
            if id and reason then
                
            local warn_rp = {
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/me засунул руку в карман, затем достал книгу, потом перо",
                "/do В записной книге написаны все участники Horny Squad.",
                "/me ручкой небрежно черканул на странице с участниками семьи",
                "/do На странице отмеченно: " .. getname(id) .. " предупреждён за: " .. reason ..".",
                "/me закрыл записную книгу и положил в карман рубашки",
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/famwarn " .. id .. " " .. reason
            }
                sampAddChatMessage(id .. " " .. reason, err_color)
                playrp(warn_rp)
            elseif id and not reason then
            reason = "Н.П.С"
            local warn_rp = {
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/me засунул руку в карман, затем достал книгу, потом перо",
                "/do В записной книге написаны все участники Horny Squad.",
                "/me ручкой небрежно черканул на странице с участниками семьи",
                "/do На странице отмеченно: " .. getname(id) .. " предупреждён за: " .. reason ..".",
                "/me закрыл записную книгу и положил в карман рубашки",
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/famwarn " .. id .. " " .. reason
            }
                playrp(warn_rp)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper 2.0 by {00ff00}Kynu{ff0000}CJIoHa{ff00ff}]{ff0000}: Команда уже активна, подождите завершения текущей!', err_color)
        end
    end)

    sampRegisterChatCommand("fuw", function(arg)
        local id, reason = cutParam(arg)
        if not isActiveCommand then
            if id and reason then
                
            local unwarn_rp = {
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/me засунул руку в карман, затем достал книгу, потом перо",
                "/do В записной книге написаны все участники Horny Squad.",
                "/me ручкой небрежно вычеркнул на странице с участниками семьи строку",
                "/do На странице вычеркнуто: " .. getname(id) .. " предупреждён...",
                "/me закрыл записную книгу и положил в карман рубашки",
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/unfamwarn " .. id .. " " .. reason
            }
            playrp(unwarn_rp)
            elseif id and not reason then
            reason = "без причины"
            local unwarn_rp = {
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/me засунул руку в карман, затем достал книгу, потом перо",
                "/do В записной книге написаны все участники Horny Squad.",
                "/me ручкой небрежно вычеркнул на странице с участниками семьи строку",
                "/do На странице вычеркнуто: " .. getname(id) .. " предупреждён...",
                "/me закрыл записную книгу и положил в карман рубашки",
                "/do В кармане рубашки лежит записная книга и ручка.",
                "/unfamwarn " .. id .. " " .. reason
            }
            playrp(unwarn_rp)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper 2.0 by {00ff00}Kynu{ff0000}CJIoHa{ff00ff}]{ff0000}: Команда уже активна, подождите завершения текущей!', err_color)
        end
    end)

    sampRegisterChatCommand("fmt", function(arg)
        local id, time, reason = cutParam(arg)
        if not isActiveCommand then
            if id and time and reason then
                
            local mute_rp = {
                "/do В кармане рубашки лежит примитивная рация.",
                "/me засунул руку в карман, затем достал устройство",
                "/do В рации записаны все участники Horny Squad FM.",
                "/me двумя руками покрутил крутилки, подёргал рычажки",
                "/do Раздался звук \"Вы отключили от волны " .. getname(id) .. " за: " .. reason .."\".",
                "/me выключил и положил рацию обратно в карман",
                "/do В кармане рубашки лежит выключенная рация.",
                "/fammute " .. id .. " " .. time .. " " .. reason
            }
                playrp(mute_rp)
            elseif id and not time and not reason then
            time = 10
            reason = "Н.П.Ч"
            local mute_rp = {
                "/do В кармане рубашки лежит примитивная рация.",
                "/me засунул руку в карман, затем достал устройство",
                "/do В рации записаны все участники Horny Squad FM.",
                "/me двумя руками покрутил крутилки, подёргал рычажки",
                "/do Раздался звук \"Вы отключили от волны " .. getname(id) .. " за: " .. reason .."\".",
                "/me выключил и положил рацию обратно в карман",
                "/do В кармане рубашки лежит выключенная рация.",
                "/fammute " .. id .. " " .. time .. " " .. reason
            }
                playrp(mute_rp)
            elseif id and time and not reason then
                reason = "Н.П.Ч"
                local mute_rp = {
                    "/do В кармане рубашки лежит примитивная рация.",
                    "/me засунул руку в карман, затем достал устройство",
                    "/do В рации записаны все участники Horny Squad FM.",
                    "/me двумя руками покрутил крутилки, подёргал рычажки",
                    "/do Раздался звук \"Вы отключили от волны " .. getname(id) .. " за: " .. reason .."\".",
                    "/me выключил и положил рацию обратно в карман",
                    "/do В кармане рубашки лежит выключенная рация.",
                    "/fammute " .. id .. " " .. time .. " " .. reason
                }
                    playrp(mute_rp)
            elseif id and reason and not time then
                time = 10
                local mute_rp = {
                    "/do В кармане рубашки лежит примитивная рация.",
                    "/me засунул руку в карман, затем достал устройство",
                    "/do В рации записаны все участники Horny Squad FM.",
                    "/me двумя руками покрутил крутилки, подёргал рычажки",
                    "/do Раздался звук \"Вы отключили от волны " .. getname(id) .. " за: " .. reason .."\".",
                    "/me выключил и положил рацию обратно в карман",
                    "/do В кармане рубашки лежит выключенная рация.",
                    "/fammute " .. id .. " " .. time .. " " .. reason
                }
                    playrp(mute_rp)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper 2.0 by {00ff00}Kynu{ff0000}CJIoHa{ff00ff}]{ff0000}: Команда уже активна, подождите завершения текущей!', err_color)
        end
    end)
end
