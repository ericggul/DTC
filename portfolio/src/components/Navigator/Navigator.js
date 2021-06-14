import React, { useState } from 'react';
import { Link, match } from 'react-router-dom';
import styles from './Navigator.module.scss';
import { projects } from '../../utils/Constants';

function Navigator({ projectId }){
    console.log(projectId);

    // const porjectLink = projectArray[projectId] = 'HOME';

    const navigator =  
        <div className={styles.navigator}>
            {projects.map((project,i)=>(
                <a href={ i !== projectId ? project.description.link : "localhost:3000"}>
                    <div>
                        { i !== projectId ? project.description.type : 'Home'}
                    </div>
                </a>
            ))}
        </div>
    
    return(
        <>
            {navigator}
        </>
    )
}

export default Navigator;