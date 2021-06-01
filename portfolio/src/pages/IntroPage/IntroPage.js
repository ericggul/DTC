import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { AnimationPresence, motion } from 'framer-motion';
import styles from './Intropage.module.scss';
import useMousePosition from '../../hooks/useMousePosition';

function IntroPage(){
    const { x, y } = useMousePosition();
    console.log(x,y);

    return(
        <div 
            className={styles.main}
            style={{background: `radial-gradient( farthest-corner at ${x}px ${y}px, #d82f2f, #222)`}}
        >
            <Link to="/main" className={styles.link}>
            <div className={styles.text}>
                Design Thinking and Communication
                <br/>
                Jeanyoon Choi
            </div>
            </Link>
        </div>
    )

}

export default IntroPage;