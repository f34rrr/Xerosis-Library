local library = {}

function library:CreateWindow(title)
    local SG = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    Main.Parent = SG
    SG.Parent = game.Players.LocalPlayer.PlayerGui
    Main.BackgroundColor3 = Color3.fromRGB(7, 17, 51)
    wait(3)
    Main:TweenSize(UDim2.new(0,440,0,300),"Out", "Sine", 2)
    Main:TweenPosition(UDim2.new(0,300,0,300),"Out", "Sine", 2)
    
    local UserInputService = game:GetService("UserInputService")
    
            local gui = Main
    
            local dragging
            local dragInput
            local dragStart
            local startPos
    
            local function update(input)
                local delta = input.Position - dragStart
                gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
    
            gui.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    dragStart = input.Position
                    startPos = gui.Position
                    
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end
            end)
    
            gui.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    dragInput = input
                end
            end)
    
            UserInputService.InputChanged:Connect(function(input)
                if input == dragInput and dragging then
                    update(input)
                end
            end)
            local Title = Instance.new("TextLabel")
            local round = Instance.new("UICorner")
            local rounded = Instance.new("UICorner")
            Title.Text = title
            Title.Parent = Main
            Title.Font = "GothamBlack"
            Title.FontSize = Enum.FontSize.Size24
            Title.TextColor3 = Color3.fromRGB(255,255,255)
            Title:TweenPosition(UDim2.new(0,50,0,30),"Out", "Sine", 1)
            
            round.Parent=Main
            round.CornerRadius = UDim.new(0, 6)
            
            rounded.Parent=btn
            rounded.CornerRadius = UDim.new(0, 6)
            local xerosis = {}
            function xerosis:NewButton()
                local btn = Instance.new("TextButton")
                btn.Parent=Main
                btn.BackgroundColor3 = Color3.fromRGB(12, 11, 38)
                btn.Text = "Button"
                btn.Parent = Main
                btn.Font = "GothamBlack"
                btn.FontSize = Enum.FontSize.Size12
                btn.TextColor3 = Color3.fromRGB(255,255,255)
                btn.Size = UDim2.new(0.2,2,0.1,2)
                btn.Position = UDim2.new(0,20,0,75)
                return xerosis
            end
            return library
        end
