import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { AnimationPresence, motion } from 'framer-motion';
import styles from './MainPage.module.scss';
import useMousePosition from '../../hooks/useMousePosition';

function MainPage(){
    const { x, y } = useMousePosition();
    const P0Link = "https://ericggul.github.io/DTC/Assignment%201/P0%20Revised%202/index.html";
    const P1Link = "https://ericggul.github.io/DTC/P1/";

    const [P0, setP0] = useState(false);
    const [P1, setP1] = useState(false);
    const [P2, setP2] = useState(false);
    const [P3, setP3] = useState(false);
    const [hoveredIndex, setHoveredIndex] = useState(0);
    const [gradientColor, setGradientColor] = useState('#d82f2f');

    console.log(P1);

    const mountedStyle = {
        opacity: '1',
        transition: '1000ms ease-in'
    }

    const unMountedStyle = {
        opacity: '0',
        transition: '1000ms ease-out'
    }

    useEffect(()=>{
        setHoveredIndex(hoveredIndex + 1)
    }, [P0, P1, P2, P3])


    return(
        <div className={styles.main}
        style={{background: `radial-gradient( 200px 200px at ${x}px ${y}px, ${gradientColor}, #222)`}}>
            <Link to="/Summary/0">
                <div className={styles.link1} onMouseEnter={() => setP0(true)} onMouseLeave={() =>setP0(false)}>
                    P0
                    <div className={styles.appear} style={P0 ? mountedStyle : unMountedStyle}>
                        Identity
                    </div>
                </div>
            </Link>
            <Link to="/Summary/1">
                <div className={styles.link2} onMouseEnter={() => setP1(true)} onMouseLeave={() =>setP1(false)}>
                    P1
                    <div className={styles.appear} style={P1 ? mountedStyle : unMountedStyle}>
                        Born, Live and Die
                    </div>
                </div>
            </Link>
            <Link to="/Summary/2">
                <div className={styles.link3} onMouseEnter={() => setP2(true)} onMouseLeave={() =>setP2(false)}>
                    P2
                    <div className={styles.appear} style={P2 ? mountedStyle : unMountedStyle}>
                        Liberty St. & Ford Ave.
                    </div>
                </div>
            </Link>
            <Link to="/Summary/3">
                <div className={styles.link4} onMouseEnter={() => setP3(true)} onMouseLeave={() =>setP3(false)}>
                    P3
                    <div className={styles.appear} style={P3 ? mountedStyle : unMountedStyle}>
                        Geur Van Eeen Tulip
                    </div>
                </div>
            </Link>
        </div>
    )

}

export default MainPage;