const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();

//-------------------------  Create Live Session ---------------------------------------- 

const createLiveSession =async(liveSessionData) =>{
    const liveSessionResponse = await prisma.live_sessions.create({
        data:liveSessionData
    })

    return liveSessionResponse;
}

//-------------------------  Create Recorded Session ---------------------------------------- 

const createRecordedSession =async(recordedSessionData) =>{
    const recordedSessionResponse = await prisma.video_recorded_sessions.create({
        data:recordedSessionData
    })

    return recordedSessionResponse;
}


//-------------------------  Get Live Session By Name ---------------------------------------- 

const getLiveSessionsByName = async(liveSessionData) =>{
    const liveSessionResponse = await prisma.live_sessions.findFirst({
        where:{
            session_name : liveSessionData
        }
    })

    return liveSessionResponse;
}

//-------------------------  Get Recorded Session By Name ---------------------------------------- 

const getRecordedSessionByName = async(recordedSessionData) =>{
    
    const recordedSessionResponse = await prisma.video_recorded_sessions.findFirst({
        where : {
            session_name : recordedSessionData
        }
    })

    return recordedSessionResponse;
}




//--------------------------- Module Exports -------------------------------------

module.exports={
    createLiveSession,
    createRecordedSession,
    getLiveSessionsByName,
    getRecordedSessionByName
}


