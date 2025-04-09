local Poop
local function FindFirstChildOfClassAndName(Parent, ClassName, Name)
    for Index, Instance in pairs(game.GetChildren(Parent)) do
    if game.IsA(Instance, ClassName) and Instance.Name == Name then
    return Instance
    end
    end
end

local currenttarget = nil
local flingtarg = false
function Reanimate()
    game.TestService.IsSleepAllowed = false
    replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
    wait(game.Players.RespawnTime + .1)
    
    game:GetService("StarterGui"):SetCore("SendNotification", { 
        Title = "Permadeath";
        Text = "Replicate Signal goes brrrrrrr 🗣️🔥💯";
        Duration = 3;
    })
    
    local OptionsAccessories = nil
    local OptionsRigTransparency = nil
    local OptionsRigR15 = nil
    local OptionsRigSetHumanoidDescription = nil
    local OptionsRigSetCharacter = nil
    local OptionsTeleportXandZoffset = nil
    local OptionsTeleportYoffset = nil
    local OptionsDisableScripts = nil
    local OptionsDisableScreenGUIs = nil
    local OptionsFlingEnabled = nil
    local OptionsFlingToolFling = nil
    local OptionsFlingTimeout = nil
    local OptionsFlingVelocity = nil
    local OptionsFlingHighlightTargets = nil
    
    local BindableEvent = nil
    local Boolean = false
    local Humanoid = nil
    local Rig = nil
    local RigHumanoid = nil
    local RigHumanoidRootPart = nil
    local Success = false
    local Time = nil
    local DeltaTime = nil
    local LastTime = nil
    
    local Attachments = { }
    local BaseParts = { }
    local Blacklist = { }
    local Enableds = { }
    local Handles = { }
    local Highlights = { }
    local RBXScriptConnections = { }
    local RigAccessories = { }
    local Tables = { }
    local Targets = { }
    
    local CFrame = CFrame
    local CFrameAngles = CFrame.Angles
    local CFrameidentity = CFrame.identity
    local CFramenew = CFrame.new
    
    local coroutine = coroutine
    local coroutinecreate = coroutine.create
    local coroutineclose = coroutine.close
    local coroutineresume = coroutine.resume
    
    local Enum = Enum
    local HumanoidStateType = Enum.HumanoidStateType
    local Physics = HumanoidStateType.Physics
    local Running = HumanoidStateType.Running
    local Track = Enum.CameraType.Track
    local UserInputType = Enum.UserInputType
    local MouseButton1 = UserInputType.MouseButton1
    local Touch = UserInputType.Touch
    
    local game = game
    local Clone = game.Clone
    local Destroy = game.Destroy
    local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
    local FindFirstChildOfClass = game.FindFirstChildOfClass
    local GetPropertyChangedSignal = game.GetPropertyChangedSignal
    local GetChildren = game.GetChildren
    local GetDescendants = game.GetDescendants
    local IsA = game.IsA
    local Players = FindFirstChildOfClass(game, "Players")
    local CreateHumanoidModelFromUserId = Players.CreateHumanoidModelFromUserId
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local RunService = FindFirstChildOfClass(game, "RunService")
    local PostSimulation = RunService.PostSimulation
    local PreRender = RunService.PreRender
    local PreSimulation = RunService.PreSimulation
    local Connect = PostSimulation.Connect
    local Disconnect = Connect(GetPropertyChangedSignal(game, "Parent"), function() end).Disconnect
    local Wait = PostSimulation.Wait
    local StarterGui = FindFirstChildOfClass(game, "StarterGui")
    local SetCore = StarterGui.SetCore
    local UserInputService = FindFirstChildOfClass(game, "UserInputService")
    local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
    local Workspace = FindFirstChildOfClass(game, "Workspace")
    local CurrentCamera = Workspace.CurrentCamera
    
    local Instancenew = Instance.new
    local Humanoid = Instancenew("Humanoid")
    local ApplyDescription = Humanoid.ApplyDescription
    local ChangeState = Humanoid.ChangeState
    local GetAppliedDescription = Humanoid.GetAppliedDescription
    local Move = Humanoid.Move
    Destroy(Humanoid)
    local Part = Instancenew("Part")
    local GetJoints = Part.GetJoints
    Destroy(Part)
    
    local math = math
    local mathabs = math.abs
    local mathrandom = math.random
    local mathsin = math.sin
    
    local osclock = os.clock
    
    local pairs = pairs
    local pcall = pcall
    
    local script = script
    
    local string = string
    local stringchar = string.char
    local stringfind = string.find
    local stringrep = string.rep
    
    local table = table
    local tableclear = table.clear
    local tablefind = table.find
    local tableinsert = table.insert
    local tableremove = table.remove
    
    local task = task
    local taskdefer = task.defer
    local taskdelay = task.delay
    local taskspawn = task.spawn
    local taskwait = task.wait
    
    local sethiddenproperty = sethiddenproperty or function() end
    
    local type = type
    local typeof = typeof
    
    local Vector3 = Vector3
    local Vector3new = Vector3.new
    local Vector3yAxis = Vector3.yAxis
    local Vector3zero = Vector3.zero
    
    local CameraCFrame = CFrameidentity
    
    local LimbSize = Vector3new(1, 2, 1)
    local TorsoSize = Vector3new(2, 2, 1)
    
    local function BreakJoints(Parent)
    for _, Instance in pairs(GetDescendants(Parent)) do
    if IsA(Instance, "JointInstance") then
    Destroy(Instance)
    end
    end
    end
    
    local function CameraSubject()
    CurrentCamera.CameraSubject = RigHumanoid
    Wait(PreRender)
    CurrentCamera.CFrame = CameraCFrame
    end
    
    local function CameraType()
    if CurrentCamera.CameraType ~= Track then
    CurrentCamera.CameraType = Track
    end
    end
    
    local function Camera()
    local Camera = Workspace.CurrentCamera
    
    if Camera then
    CameraCFrame = Camera.CFrame
    CurrentCamera = Camera
    
    CameraSubject()
    CameraType()
    
    tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(Camera, "CameraSubject"), CameraSubject))
    tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(Camera, "CameraType"), CameraType))
    end
    end
    
    local function WaitForChildOfClassAndName(Parent, ...)
    local Instance = FindFirstChildOfClassAndName(Parent, ...)
    
    while not Instance and typeof(Parent) == "Instance" do
    Instance = FindFirstChildOfClassAndName(Parent, ...)
    Wait(Parent.ChildAdded)
    end
    
    return Instance
    end
    
    local function Invisible(Instance)
    if IsA(Instance, "BasePart") or IsA(Instance, "Decal") then
    Instance.Transparency = OptionsRigTransparency
    elseif IsA(Instance, "ForceField") or IsA(Instance, "Explosion") then
    Instance.Visible = false
    elseif IsA(Instance, "ParticleEmitter") or IsA(Instance, "Fire") or IsA(Instance, "Sparkles") then
    Instance.Enabled = false
    end
    end
    
    local function DescendantAdded(Instance)
    if IsA(Instance, "Attachment") then
    local Handle = Instance.Parent
    
    if IsA(Handle, "BasePart") then
    local AttachmentsAttachment = Attachments[Instance.Name]
    
    if AttachmentsAttachment then
    local MeshId = ""
    local TextureId = ""
    
    if IsA(Handle, "MeshPart") then
    MeshId = Handle.MeshId
    TextureId = Handle.TextureID
    else
    local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")
    
    if SpecialMesh then
    MeshId = SpecialMesh.MeshId
    TextureId = SpecialMesh.TextureId
    end
    end
    
    for Index, Table in pairs(OptionsAccessories) do
    if stringfind(MeshId, Table.MeshId or "") and stringfind(TextureId, Table.TextureId or "") then
    local Instance = FindFirstChildOfClassAndName(Rig, "BasePart", Table.Name)
    
    local AlternativeName = Table.AlternativeName
    local AlternativeInstance = false
    
    if not Instance and AlternativeName then
    Instance = FindFirstChildOfClassAndName(Rig, "BasePart", AlternativeName)
    AlternativeInstance = true
    end
    
    if Instance and not tablefind(Blacklist, Instance) then
    if Table.Blacklist then
    tableinsert(Blacklist, Instance)
    end
    BreakJoints(Handle)
    
    tableinsert(Tables, { Part0 = Handle, Part1 = Instance, CFrame = AlternativeInstance and Table.AllowAlternativeCFrame and Table.AlternativeCFrame or Table.CoordinateFrame, LastPosition = Instance.Position })
    return
    end
    end
    end
    for Index, Table in pairs(RigAccessories) do
    local TableHandle = Table.Handle
    
    if typeof(TableHandle) == "Instance" and Table.MeshId == MeshId and Table.TextureId == TextureId then
    BreakJoints(Handle)
    tableinsert(Tables, { Part0 = Handle, Part1 = TableHandle, LastPosition = TableHandle.Position })
    return
    end
    end
    
    local Accessory = Handle.Parent
    
    if IsA(Accessory, "Accessory") then
    local AccessoryClone = Instancenew("Accessory")
    AccessoryClone.Name = Accessory.Name
    
    local HandleClone = Clone(Handle)
    Invisible(HandleClone)
    BreakJoints(HandleClone)
    HandleClone.Parent = AccessoryClone
    
    local Weld = Instancenew("Weld")
    Weld.Name = "AccessoryWeld"
    Weld.C0 = Instance.CFrame
    Weld.C1 = AttachmentsAttachment.CFrame
    Weld.Part0 = HandleClone
    Weld.Part1 = AttachmentsAttachment.Parent
    Weld.Parent = HandleClone
    
    tableinsert(RigAccessories, { Handle = HandleClone, MeshId = MeshId, TextureId = TextureId })
    tableinsert(Tables, { Part0 = Handle, Part1 = HandleClone, LastPosition = HandleClone.Position })
    
    AccessoryClone.Parent = Rig
    end
    end
    end
    elseif IsA(Instance, "BasePart") then
    Instance.CanQuery = false
    tableinsert(BaseParts, Instance)
    end
    end
    
    local function ApplyDescriptionRig()
    local Description = GetAppliedDescription(Humanoid)
    Description.HatAccessory = ""
    Description.BackAccessory = ""
    Description.FaceAccessory = ""
    Description.HairAccessory = ""
    Description.NeckAccessory = ""
    Description.FrontAccessory = ""
    Description.WaistAccessory = ""
    Description.ShouldersAccessory = ""
    ApplyDescription(RigHumanoid, Description)
    
    for Index, Instance in pairs(GetDescendants(Rig)) do
    Invisible(Instance)
    end
    end
    
    local function SetCharacter()
    taskwait()
    LocalPlayer.Character = Rig
    end
    
    local Tools = { }
    
    local function CharacterAdded()
    local Character = LocalPlayer.Character
    
    
    if Character and Character ~= Rig then
    if OptionsFlingToolFling then
    for Index, Backpack in pairs(GetChildren(LocalPlayer)) do
    if IsA(Backpack, "Backpack") then
    for Index, Instance in pairs(GetChildren(Backpack)) do
    if IsA(Instance, "Tool") then
    Tools[Instance] = FindFirstChildOfClassAndName(Instance, "BasePart", "Handle")	
    Instance.Parent = Character
    end
    end
    end
    end
    end
    
    for i,v in next, Character:GetDescendants() do
    if v:IsA("BasePart") and v.Name ~= "Poop" then 
    game:GetService("RunService").Heartbeat:connect(function()
    pcall(function()
    v.CanCollide = false
    v.Massless = true
    end)
    end)
    end
    end
    
    if OptionsRigSetCharacter then
    taskspawn(SetCharacter)
    end
    
    tableclear(BaseParts)
    tableclear(Blacklist)
    tableclear(Tables)
    
    if CurrentCamera then
    CameraCFrame = CurrentCamera.CFrame
    end
    
    for Index, Instance in pairs(GetDescendants(Character)) do
    DescendantAdded(Instance)
    end
    
    tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))
    
    Humanoid = WaitForChildOfClassAndName(Character, "Humanoid", "Humanoid")
    local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")
    
    if Boolean then
    Camera()
    
    if HumanoidRootPart then
    RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame
    Boolean = false
    end
    
    if OptionsRigSetHumanoidDescription and RigHumanoid and Humanoid then
    pcall(ApplyDescriptionRig)
    end
    end
    
    if HumanoidRootPart then
    for Index, Table in pairs(Targets) do
    if not HumanoidRootPart then
    break
    end
    
    if Humanoid then
    ChangeState(Humanoid, Physics)
    end
    
    local Target = Table.Target
    
    local Timeout = Time + OptionsFlingTimeout
    local LastPosition = Target.Position
    
    while Target and HumanoidRootPart do
    if Time > Timeout then
    break
    end
    
    local Position = Target.Position
    local LinearVelocity = ( Position - LastPosition ) / DeltaTime
    
    if LinearVelocity.Magnitude > 50 then
    break
    end
    
    LastPosition = Position
    
    HumanoidRootPart.AssemblyAngularVelocity = OptionsFlingVelocity
    HumanoidRootPart.AssemblyLinearVelocity = OptionsFlingVelocity
    
    HumanoidRootPart.CFrame = Target.CFrame * CFramenew(0, 0, 4 * mathsin(Time * 30)) * CFrameAngles(mathrandom(- 360, 360), mathrandom(- 360, 360), mathrandom(- 360, 360)) + ( LinearVelocity * 0.5) 
    taskwait()
    end
    
    local Highlight = Table.Highlight
    
    if Highlight then
    Destroy(Highlight)
    end
    
    Targets[Index] = nil
    end
    
    if Humanoid then
    ChangeState(Humanoid, Running)
    end
    
    if RigHumanoidRootPart then
    HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
    HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
    HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportXandZoffset, OptionsTeleportXandZoffset), OptionsTeleportYoffset, mathrandom(- OptionsTeleportXandZoffset, OptionsTeleportXandZoffset))
    end
    end
    
    
    if Character then
    BreakJoints(Character)
    end
    end
    end
    
    local rgb = Color3.fromHSV(1,1,1)
    local rgbhighlights = {}
    game:GetService("RunService").Heartbeat:Connect(function()
        for i = 0,1,0.004 do
			rgb = Color3.fromHSV(i,1,1)
        end
        --[[
	       for _,hl in pairs(rgbhighlights) do
            hl.OutlineColor = rgb
            hl.FillColor = rgb
        end
        ]]
    end)
    
    local function PostSimulationConnect()
    sethiddenproperty(LocalPlayer, "SimulationRadius", 2147483647)
    
    Time = osclock()
    DeltaTime = Time - LastTime
    LastTime = Time
    
    local Integer = 29 + mathsin(Time)
    local Vector3 = Vector3new(0, 0, 0.002 * mathsin(Time * 25))
    
    for Index, Table in pairs(Tables) do
    local Part0 = Table.Part0
    local Part1 = Table.Part1
    
    if Part0 and # GetJoints(Part0) == 0 and Part0.ReceiveAge == 0 and Part1 then
    Part0.AssemblyAngularVelocity = Vector3zero
    
    local Position = Part1.Position
    local LinearVelocity = ( ( Table.LastPosition - Position ) / DeltaTime ) * Integer
    Table.LastPosition = Position
    
    Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Integer, LinearVelocity.Z)
    
    Part0.CFrame = Part1.CFrame * ( Table.CFrame or CFrameidentity ) + Vector3
    end
    end
    
    local Hit = Mouse.Hit
    local Holding = IsMouseButtonPressed(UserInputService, MouseButton1)
    
    for Tool, BasePart in pairs(Tools) do
    if BasePart.ReceiveAge == 0 and # GetJoints(BasePart) == 0 then
    BasePart.CanCollide = false
    BasePart.AssemblyAngularVelocity = Vector3new(9e9,9e9,9e9)
    BasePart.AssemblyLinearVelocity = Vector3new(9e9,9e9,9e9)
    
    local omgitskorn =  Instance.new("Highlight")  
    omgitskorn.Parent = BasePart
    omgitskorn.FillTransparency = 0.7
    omgitskorn.FillColor = rgb
    omgitskorn.OutlineColor = rgb
    table.insert(rgbhighlights,omgitskorn)
    
    if Holding then
    BasePart.CFrame = Hit  * CFrameAngles(mathrandom(- 360, 360), mathrandom(- 360, 360), mathrandom(- 360, 360))
    elseif flingtarg == true then
    print("flinging target")
    BasePart.CFrame = currenttarget.CFrame  * CFrame.new(mathrandom(- 2, 2),0,mathrandom(- 2, 2)) * CFrameAngles(mathrandom(- 360, 360), mathrandom(- 360, 360), mathrandom(- 360, 360))
    elseif RigHumanoidRootPart and flingtarg ~= true then
    BasePart.CFrame = RigHumanoidRootPart.CFrame * CFramenew(0, -5, 0) * CFrameAngles(mathrandom(- 360, 360), mathrandom(- 360, 360), mathrandom(- 360, 360))
    end
    end
    end
    
    if RigHumanoid and Humanoid then
    RigHumanoid.Jump = Humanoid.Jump
    Move(RigHumanoid, Humanoid.MoveDirection)
    end
    
    if not Success then
    Success = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
    else
    SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
    end
    end
    
    local function PreSimulationConnect()
    for Index, BasePart in pairs(BaseParts) do
        if BasePart.Name ~= "Poop" then
    BasePart.CanCollide = false
    end
    end
    end
    
    local function Fling(Target)
    if typeof(Target) == "Instance" then
    if IsA(Target, "Humanoid") then
    Target = Target.Parent
    end
    if IsA(Target.Parent, "Accessory") then
    Target = FindFirstAncestorOfClass(Target, "Model")
    end
    if IsA(Target, "Model") then
    Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart")
    end
    if IsA(Target, "BasePart") then
    for Index, Table in pairs(Targets) do
    if Table.Target == Target then
    return
    end
    end
    
    local Parent = Target.Parent
    
    local Highlight = nil
    
    if OptionsFlingHighlightTargets then
    Highlight = Instancenew("Highlight")
    Highlight.Adornee = Parent
    Highlight.Parent = Parent
    tableinsert(Highlights, Highlight)
    end
    
    tableinsert(Targets, {Highlight = Highlight, Target = Target})
    end
    end
    end
    
    local function InputBegan(InputObject)
    local UserInputType = InputObject.UserInputType
    
    if UserInputType == MouseButton1 or UserInputType == Touch then
    local Target = Mouse.Target
    
    if Target and not Target.Anchored then
    local Model = Target.Parent
    
    if IsA(Model, "Model") and FindFirstChildOfClass(Model, "Humanoid") then
    local HumanoidRootPart = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart")
    
    if HumanoidRootPart then
    Fling(HumanoidRootPart)
    end
    else
    Fling(Target)
    end
    end
    end
    end
    
    local function gameDescendantAdded(Instance)
    if ( OptionsDisableScreenGUIs and IsA(Instance, "ScreenGui") ) or ( OptionsDisableScripts and Instance ~= script and ( IsA(Instance, "LocalScript") or IsA(Instance, "Script") ) ) then
    Enableds[Instance] = Instance.Enabled
    Instance.Enabled = false
    
    tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(Instance, "Enabled"), function()
    Enableds[Instance] = Instance.Enabled
    Instance.Enabled = false
    end))
    end
    end
    
    local function Stop()
    game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Reanimation"; Text = "Player has reset."; Icon = "rbxthumb://type=Asset&id=8429198112&w=150&h=150"})
    replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
    
    for Index, RBXScriptConnection in pairs(RBXScriptConnections) do
    Disconnect(RBXScriptConnection)
    end
    for Index, Highlight in pairs(Highlights) do
    Destroy(Highlight)
    end
    for Instance, Boolean in pairs(Enableds) do
    Instance.Enabled = Boolean
    end
    
    tableclear(Attachments)
    tableclear(BaseParts)
    tableclear(Enableds)
    tableclear(Handles)
    tableclear(Highlights)
    tableclear(RBXScriptConnections)
    tableclear(Tables)
    tableclear(Targets)
    
    if Rig then
    Destroy(Rig)
    end
    
    Destroy(BindableEvent)
    SetCore(StarterGui, "ResetButtonCallback", true)
    end
    
    local Emperean = {
    Stop = Stop,
    Start = function(Options)
    Options = Options or { }
    OptionsAccessories = Options.Accessories or {}
    local OptionsRig = Options.Rig
    OptionsRigTransparency = OptionsRig.Transparency
    OptionsRigR15 = OptionsRig.R15
    OptionsRigSetHumanoidDescription = OptionsRig.SetHumanoidDescription
    OptionsRigSetCharacter = OptionsRig.SetCharacter
    local OptionsTeleport = Options.Teleport or {}
    local XandYoffset = OptionsTeleport.XandYoffset
    OptionsTeleportXandZoffset = XandYoffset and mathabs(XandYoffset) or 6
    OptionsTeleportYoffset = OptionsTeleport.Yoffset or 0
    local OptionsDisable = Options.Disable
    OptionsDisableScripts = OptionsDisable.Scripts
    OptionsDisableScreenGUIs = OptionsDisable.GUIs
    local OptionsFling = Options.Fling or {}
    OptionsFlingEnabled = OptionsFling.Enabled
    OptionsFlingToolFling = OptionsFling.ToolFling
    OptionsFlingTimeout = OptionsFling.Timeout or 1.5
    OptionsFlingVelocity = OptionsFling.Velocity or Vector3new(0, 4096, 0)
    OptionsFlingHighlightTargets = OptionsFling.HighlightTargets
    
    if OptionsDisableScripts or OptionsDisableScreenGUIs then
    for Index, Instance in pairs(GetDescendants(game)) do
    gameDescendantAdded(Instance)
    end
    
    tableinsert(RBXScriptConnections, Connect(game.DescendantAdded, gameDescendantAdded))
    end
    
    Boolean = true
    LastTime = osclock()
    
    Rig = OptionsRigR15 and CreateHumanoidModelFromUserId(Players, 5532894300) or CreateHumanoidModelFromUserId(Players, 5532891747)
    Rig.Name = "non"
    
    Poop = Instance.new("Part", Rig)
    Poop.Name = "Poop"
    Poop.Transparency = 1
    Poop.CanCollide = true
    Poop.Anchored = false
    
    for i,v in next, Rig:GetDescendants() do
    if v:IsA("BasePart") then 
    game:GetService("RunService").Heartbeat:connect(function()
    pcall(function()
    if v.Name ~= "Poop" then
    v.CanCollide = false
    v.CanQuery = false
    end
    end)
    end)
    end
    end
    
    RigHumanoid = Rig.Humanoid
    RigHumanoidRootPart = Rig.HumanoidRootPart
    Rig.Parent = Workspace
    
    for Index, Instance in pairs(GetDescendants(Rig)) do
    if IsA(Instance, "Attachment") then
    Attachments[Instance.Name] = Instance
    else
    Invisible(Instance)
    end
    end
    
    BindableEvent = Instancenew("BindableEvent")
    Connect(BindableEvent.Event, Stop)
    
    tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(Workspace, "CurrentCamera"), Camera))
    
    CharacterAdded()
    tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(LocalPlayer, "Character"), CharacterAdded))
    
    if OptionsFlingEnabled then
    tableinsert(RBXScriptConnections, Connect(UserInputService.InputBegan, InputBegan))
    end
    
    tableinsert(RBXScriptConnections, Connect(PreSimulation, PreSimulationConnect))
    tableinsert(RBXScriptConnections, Connect(PostSimulation, PostSimulationConnect))
    
    return { 
    Rig = Rig,
    Options = Options,
    Fling = Fling,
    },
    taskwait()
    end,
    }
    
    Emperean.Start({
    Accessories = {
    -- Free Rig
    { Blacklist = true, Name = "Torso", AlternativeName = "UpperTorso", MeshId = "4819720316", TextureId = "4819722776", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 0, -0.25), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Right Arm", AlternativeName = "RightLowerArm", MeshId = "3030546036", TextureId = "3033903209", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(-1.57, 0, -1.57), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Arm", AlternativeName = "LeftLowerArm", MeshId = "3030546036", TextureId = "3360978739", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(-1.57, 0, 1.57), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Right Leg", AlternativeName = "RightLowerLeg", MeshId = "3030546036", TextureId = "3033898741", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(-1.57, 0, -1.57), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Leg", AlternativeName = "LeftLowerLeg", MeshId = "3030546036", TextureId = "3409604993", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(-1.57, 0, 1.57), AlternativeCFrame = CFrameidentity },
    
    -- Cheap Paid Rig
    { Blacklist = true, Name = "Right Arm", AlternativeName = "RightLowerArm", MeshId = "12344206657", TextureId = "12344206675", AllowAlternativeCFrame = false, CoordinateFrame = CFramenew(-0.095, 0, 0) * CFrameAngles(- 2, 0, 0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Arm", AlternativeName = "LeftLowerArm", MeshId = "12344207333", TextureId = "12344207341", AllowAlternativeCFrame = false, CoordinateFrame = CFramenew(0.095, 0, 0) * CFrameAngles(- 2, 0, 0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Right Leg", AlternativeName = "RightLowerLeg", MeshId = "11263221350", TextureId = "11263219250", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(1.57, - 1.57, 0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Leg", AlternativeName = "LeftLowerLeg", MeshId = "11159370334", TextureId = "11159284657", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(1.57, 1.57, 0), AlternativeCFrame = CFrameidentity },
    
    -- Mesh Rig
    { Blacklist = true, Name = "Torso", AlternativeName = "UpperTorso", MeshId = "127552124837034", TextureId = "131014325980101", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 0, 0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Right Arm", AlternativeName = "RightLowerArm", MeshId = "121304376791439", TextureId = "131014325980101", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 0, 0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Arm", AlternativeName = "LeftLowerArm", MeshId = "117287001096396", TextureId = "120169691545791", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 0, 0), AlternativeCFrame = CFrameidentity },    
    { Blacklist = true, Name = "Right Leg", AlternativeName = "RightLowerLeg", MeshId = "121304376791439", TextureId = "131014325980101", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 0, 0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Leg", AlternativeName = "LeftLowerLeg", MeshId = "117287001096396", TextureId = "120169691545791", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 0, 0), AlternativeCFrame = CFrameidentity },
    
    -- (OLD) Noob Rig
    { Blacklist = true, Name = "Torso", AlternativeName = "UpperTorso", MeshId = "18640899369", TextureId = "18640899481", AllowAlternativeCFrame = false, CoordinateFrame = CFrameidentity, AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Right Arm", AlternativeName = "RightLowerArm", MeshId = "18640914129", TextureId = "18640914168", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Arm", AlternativeName = "LeftLowerArm", MeshId = "18640914129", TextureId = "18640914168", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 0), AlternativeCFrame = CFrameidentity },    
    { Blacklist = true, Name = "Right Leg", AlternativeName = "RightLowerLeg", MeshId = "18640901641", TextureId = "18640901676", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Leg", AlternativeName = "LeftLowerLeg", MeshId = "18640901641", TextureId = "18640901676", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 0), AlternativeCFrame = CFrameidentity },
    
    -- (OLD) Accurate Paid Rig
    { Blacklist = true, Name = "Torso", AlternativeName = "UpperTorso", MeshId = "14241018198", TextureId = "14251599953", AllowAlternativeCFrame = false, CoordinateFrame = CFrameidentity, AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Right Arm", AlternativeName = "RightLowerArm", MeshId = "17374767929", TextureId = "17374768001", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 1.57), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Arm", AlternativeName = "LeftLowerArm", MeshId = "17374767929", TextureId = "17374768001", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 1.57), AlternativeCFrame = CFrameidentity },	
    { Blacklist = true, Name = "Right Leg", AlternativeName = "RightLowerLeg", MeshId = "17387586286", TextureId = "17387586304", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 1.57), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Leg", AlternativeName = "LeftLowerLeg", MeshId = "17387586286", TextureId = "17387586304", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 1.57), AlternativeCFrame = CFrameidentity },
    
    -- (OLD) White arms below
    { Blacklist = true, Name = "Right Arm", AlternativeName = "RightLowerArm", MeshId = "14255522247", TextureId = "14255543546", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 1.57), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Arm", AlternativeName = "LeftLowerArm", MeshId = "14255522247", TextureId = "14255543546", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0, 1.57, 1.57), AlternativeCFrame = CFrameidentity },
    
    --My own Rig
    { Blacklist = true, Name = "Head", AlternativeName = "Head", MeshId = "13058343355", TextureId = "", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0,3.141592653589793,0), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Arm", AlternativeName = "LeftLowerArm", MeshId = "90736849096372", TextureId = "", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0,0,1.5707963267948966), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Right Arm", AlternativeName = "RightLowerArm", MeshId = "105141400603933", TextureId = "", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0,0,1.5707963267948966), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Left Leg", AlternativeName = "LeftLowerLeg", MeshId = "139733645770094", TextureId = "", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0,0,1.5707963267948966), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Right Leg", AlternativeName = "RightLowerLeg", MeshId = "99608462237958", TextureId = "", AllowAlternativeCFrame = false, CoordinateFrame = CFrameAngles(0,0,1.5707963267948966), AlternativeCFrame = CFrameidentity },
    { Blacklist = true, Name = "Torso", AlternativeName = "UpperTorso", MeshId = "110684113028749", TextureId = "", AllowAlternativeCFrame = false, CoordinateFrame = CFrameidentity, AlternativeCFrame = CFrameidentity },
    
    --Poop
    { Blacklist = false, Name = "Poop", AlternativeName = "Poop", MeshId = "12644198835", TextureId = "12644110338", AllowAlternativeCFrame = false, CoordinateFrame = CFrameidentity, AlternativeCFrame = CFrameidentity },
    
    },
    Rig = {
    Transparency = 1,
    R15 = false,
    SetHumanoidDescription = true,
    SetCharacter = false
    },
    Teleport = {
    XandZoffset = 0,
    Yoffset = -25
    },
    Disable = {
    Scripts = true,
    ScreenGUIs = false
    },
    Fling = {
    Enabled = false,
    ToolFling = true,
    Timeout = 0,
    Velocity = Vector3new(0, 0, 0),
    HighlightTargets = false
    }
    })
    end
    
    Reanimate()
    
    function CastRay(startPos,endPos,range,ignoreList)
    local ray = Ray.new(startPos,(endPos-startPos).unit*range)
    local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
    return part,pos,norm,(pos and (startPos-pos).magnitude)
    end
    
    local starttime = os.clock()
    local notif = loadstring(game:HttpGet("https://gist.githubusercontent.com/S0MEONEuKnow/dad8380875f4d1a25b8e088d630a7823/raw/38888427d444b8b67aa7c78e7cfbb44625c62bc6/NotificationsService.luau"))()
    
    local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = workspace.non;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

local pooped = false
local pooping = false
local ithinkroot = workspace:WaitForChild('non'):WaitForChild("HumanoidRootPart")
local poopweld = Instance.new("Weld",ithinkroot)
poopweld.Part1 = Poop
poopweld.Part0 = poopweld.Parent
poopweld.C1 = CFrame.new(0,7,0)

local uis = game:GetService("UserInputService")

uis.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.E then
        pcall(function()
        pooped = true
        pooping = true
        poopweld.Enabled = false
        Poop.CanCollide = false
        Poop.CFrame = Torso.CFrame*CFrame.new(0,-0.2,-0.8)
        game:GetService('TweenService'):Create(Poop,TweenInfo.new(2.1),{CFrame = Torso.CFrame*CFrame.new(0,-1.8,0.9)}):Play()
        game:GetService('TweenService'):Create(Poop,TweenInfo.new(2.1),{Velocity = Vector3.zero}):Play()

        task.delay(2.1,function()pooping = false
        Poop.CanCollide = true
        end)
        end)
    end
end)

notif("Successfully loaded Poop Dog in "..tostring(os.clock()-starttime).."s")

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims) then --and not pooping then
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),-1.2+0.05*M.S(Sine/24), -0.4+0*M.S(Sine/24)) * CF.A(M.R(-30+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/100), 0+0*M.S(Sine/24)) * CF.A(M.R(10+0*M.S(Sine/24)), M.R(10+5*M.S(Sine/100)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.6+0*M.S(Sine/24),0.1+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(30+0*M.S(Sine/24)), M.R(8+0*M.S(Sine/24)) ,M.R(3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.6+0*M.S(Sine/24),0.1+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(30+0*M.S(Sine/24)), M.R(8+0*M.S(Sine/24)) ,M.R(-3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.8+0*M.S(Sine/24),-2.5+0*M.S(Sine/24), -0.3+0*M.S(Sine/24)) * CF.A(M.R(90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(28+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-1+0*M.S(Sine/24),-2.5+0*M.S(Sine/24), -0.3+0*M.S(Sine/24)) * CF.A(M.R(90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-28+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),-0.7+0.05*M.S(Sine/24), -0.4+0*M.S(Sine/24)) * CF.A(M.R(-75+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/100), 0+0*M.S(Sine/24)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(10+5*M.S(Sine/100)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.6+0*M.S(Sine/10),0.8+0*M.S(Sine/24), -0.9+0*M.S(Sine/24)) * CF.A(M.R(90+20*M.S(Sine/10)), M.R(8+0*M.S(Sine/24)) ,M.R(3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.6+0*M.S(Sine/10),0.8+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(90+-20*M.S(Sine/10)), M.R(8+0*M.S(Sine/24)) ,M.R(-3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.6+0*M.S(Sine/15),-1.95+0*M.S(Sine/24), 0.3+0*M.S(Sine/24)) * CF.A(M.R(0+-15*M.S(Sine/15)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.6+0*M.S(Sine/15),-1.95+0*M.S(Sine/24), 0.3+0*M.S(Sine/24)) * CF.A(M.R(0+15*M.S(Sine/15)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
Animate('RJ',CF.N(0+0*M.S(Sine/24),-1.2+0.05*M.S(Sine/24), -0.4+0*M.S(Sine/24)) * CF.A(M.R(-30+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/100), 0+0*M.S(Sine/24)) * CF.A(M.R(10+0*M.S(Sine/24)), M.R(10+5*M.S(Sine/100)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.6+0*M.S(Sine/24),0.1+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(30+0*M.S(Sine/24)), M.R(8+0*M.S(Sine/24)) ,M.R(3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.6+0*M.S(Sine/24),0.1+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(30+0*M.S(Sine/24)), M.R(8+0*M.S(Sine/24)) ,M.R(-3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.8+0*M.S(Sine/24),-2.5+0*M.S(Sine/24), -0.3+0*M.S(Sine/24)) * CF.A(M.R(90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(28+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-1+0*M.S(Sine/24),-2.5+0*M.S(Sine/24), -0.3+0*M.S(Sine/24)) * CF.A(M.R(90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-28+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
Animate('RJ',CF.N(0+0*M.S(Sine/24),-1.2+0.05*M.S(Sine/24), -0.4+0*M.S(Sine/24)) * CF.A(M.R(-30+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/100), 0+0*M.S(Sine/24)) * CF.A(M.R(10+0*M.S(Sine/24)), M.R(10+5*M.S(Sine/100)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.6+0*M.S(Sine/24),0.1+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(30+0*M.S(Sine/24)), M.R(8+0*M.S(Sine/24)) ,M.R(3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.6+0*M.S(Sine/24),0.1+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(30+0*M.S(Sine/24)), M.R(8+0*M.S(Sine/24)) ,M.R(-3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.8+0*M.S(Sine/24),-2.5+0*M.S(Sine/24), -0.3+0*M.S(Sine/24)) * CF.A(M.R(90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(28+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-1+0*M.S(Sine/24),-2.5+0*M.S(Sine/24), -0.3+0*M.S(Sine/24)) * CF.A(M.R(90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-28+0*M.S(Sine/24))),0.2,'Lerp')
end
else 
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),-1.2+0.05*M.S(Sine/24), -0.4+0*M.S(Sine/24)) * CF.A(M.R(-30+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/100), 0+0*M.S(Sine/24)) * CF.A(M.R(10+0*M.S(Sine/24)), M.R(10+5*M.S(Sine/100)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.6+0*M.S(Sine/24),0.1+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(30+0*M.S(Sine/24)), M.R(8+0*M.S(Sine/24)) ,M.R(3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.6+0*M.S(Sine/24),0.1+0*M.S(Sine/24), -0.8+0*M.S(Sine/24)) * CF.A(M.R(30+0*M.S(Sine/24)), M.R(8+0*M.S(Sine/24)) ,M.R(-3+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.8+0*M.S(Sine/24),-2.5+0*M.S(Sine/24), -0.3+0*M.S(Sine/24)) * CF.A(M.R(90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(28+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-1+0*M.S(Sine/24),-2.5+0*M.S(Sine/24), -0.3+0*M.S(Sine/24)) * CF.A(M.R(90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-28+0*M.S(Sine/24))),0.2,'Lerp')
end
if not pooped then
Poop.CanCollide = false
poopweld.Enabled = true
end

fwait()
end
