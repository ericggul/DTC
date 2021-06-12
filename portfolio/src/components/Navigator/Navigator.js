import React, { useState } from 'react';
import { Link, match } from 'react-router-dom';
import styles from './Navigator.module.scss';

function Navigator({ projectId }){
    console.log(projectId);

    const projectArray = ['P0', 'P1', 'P2', 'P3'];
    projectArray[projectId] = 'HOME';

    const navigator =  
        <div className={styles.navigator}>
            {projectArray.map((e,i)=>(
                <div>
                    {e}
                </div>
            ))}
        </div>
    
    return(
        <>
            {navigator}
        </>
    )
}

export default Navigator;