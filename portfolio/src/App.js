import React from 'react';
import './App.css';
import {
  Route, Switch, Redirect, BrowserRouter as Router,
} from 'react-router-dom';
import IntroPage from './pages/IntroPage/IntroPage';
import MainPage from './pages/MainPage/MainPage';
import SummaryPage from './pages/SummaryPage/SummaryPage';
import P2 from './pages/P2/P2';

function App() {
  return (
    <Router>
      <Switch>
        <Route exact path="/main" component={MainPage} />
        <Route exact path="/intro" component={IntroPage} />
        <Route exact path="/summary/:id" component={SummaryPage} />
        <Route exact path="/P2" component={P2} />
        
        <Redirect exact to="/intro" />
      </Switch>
    </Router>
  );
}

export default App;