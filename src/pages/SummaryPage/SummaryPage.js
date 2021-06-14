import React, { useState, useEffect } from 'react';
import { Link, match } from 'react-router-dom';
import { AnimationPresence, motion } from 'framer-motion';
import styles from './SummaryPage.module.scss';
import useMousePosition from '../../hooks/useMousePosition';
import { projects } from '../../utils/Constants';
import Navigator from '../../components/Navigator/Navigator';


function SummaryPage({ match }){
    const { x, y } = useMousePosition();
    const id = Number(match.params.id);
    const project = projects.find((project) => project.id === id);

    console.log(project?.description.name);

    const [opacity, setOpacity] = useState(0);

    const hoverMessage = 
        <div className={styles.hoverMessage} styles={{opacity: opacity}}>
            Click n' View
        </div>

    return(
        <div 
            className={styles.main}
            style={{background: `radial-gradient( 30px 30px at ${x}px ${y}px, #d82f2f, #222)`}}
        >   
            <Navigator 
                    projectId={id}
            />            
            <div className={styles.header}>
                {project?.description.type}: {project?.description.assign}
            </div>

            <a href={project?.description.link}>
                <div className={styles.img} onMouseEnter={()=>console.log('entered')} onMouseLeave={()=>setOpacity(0)}>
                    <img src={project?.image} alt={project?.id} />
                </div>
            </a>
            <div className={styles.name}>
                {project?.description.name}
            </div>
            <div className={styles.description}>
                {project?.description.introduction}
            </div>

        </div>
    )

}

export default SummaryPage;