import React from 'react';
import P2Img from '../../assets/P2Img.png';
import styles from './P2.module.scss';

function P2(){
    return(
        <div className={styles.container}>
            <img src = {P2Img} />
            <a href= {P2Img} download  >
                <div className={styles.download}>
                    Download
                </div>
            </a>
        </div>
    )
}

export default P2;