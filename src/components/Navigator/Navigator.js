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
                <Link to={ i !== projectId ? `/Summary/${i}` : `/Main`}>
                    <div>
                        { i !== projectId ? project.description.type : 'Home'}
                    </div>
                </Link>
            ))}
        </div>
    
    return(
        <>
            {navigator}
        </>
    )
}

export default Navigator;