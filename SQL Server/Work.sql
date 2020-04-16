-- IT SECURITY SOFTWARE REPORT --
SELECT cl.CollectionName, cm.Name
FROM collectionmembers cm, collections cl 
WHERE cl.SiteID = cm.SiteID AND cl.CollectionName = 'Workstations Without Carbon Black'
OR cl.SiteID = cm.SiteID AND cl.CollectionName = 'Workstations Without CB Protection Agent (Bit9)'
OR cl.SiteID = cm.SiteID AND cl.CollectionName = 'Workstations Without Symantec'
ORDER BY cl.CollectionName ASC

-- COMPUTERS WITH INTEL(R) HD GRAPHICS 620 - VIDEO CARD REPORT --
SELECT S.Name0 'Hostname', CS.Model0 'Model', S.User_Name0 'Last Logon User', S.Last_Logon_Timestamp0 'Last Logon Time'
FROM v_R_System S, collectionmembers CM, collections CL, v_GS_computer_system CS
WHERE CM.Name = S.Name0 AND CM.Name = CS.Name0 AND CM.SiteID = CL.SiteID 
AND CL.CollectionName = 'Workstations With Intel HD Graphics 620 - Video Card'
ORDER BY S.Name0 ASC

-- Old Symantec Report --
SELECT collectionmembers.Name
FROM collectionmembers
WHERE SiteID = 'SL40021D'
ORDER BY Name ASC

-- TEST --
SELECT S.Name0 'Hostname', CS.Model0 'Model', S.User_Name0 'Last Logon User', S.Last_Logon_Timestamp0 'Last Logon Time'
FROM v_R_System S, collectionmembers CM, collections CL, v_GS_computer_system CS
WHERE CM.Name = S.Name0 AND CM.Name = CS.Name0
AND CM.SiteID = CL.SiteID 
AND CL.CollectionName = 'Workstations With Intel HD Graphics 620 - Video Card'
ORDER BY S.Name0 ASC