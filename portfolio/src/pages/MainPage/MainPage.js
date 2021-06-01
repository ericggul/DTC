import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { AnimationPresence, motion } from 'framer-motion';
import styles from './MainPage.module.scss';
import useMousePosition from '../../hooks/useMousePosition';

function MainPage(){
    const P0Link = "https://ericggul.github.io/DTC/Assignment%201/P0%20Revised%202/index.html";
    const P1Link = "https://ericggul.github.io/DTC/P1/";

    return(
        <div className={styles.main}>

            
            <a href={P0Link} className={styles.link}>P0</a>
            <a href={P1Link} className={styles.link}>P1</a>
            <Link to="/P2" className={styles.link}>P2</Link>
 
            P3
        </div>
    )

}

export default MainPage;