// see https://github.com/bitnami/containers/blob/main/bitnami/jenkins/2/debian-11/rootfs/opt/bitnami/scripts/jenkins/bitnami-templates/init-jenkins.groovy.tpl
// Inspired by https://github.com/jenkinsci/jenkins/blob/e1beed03962bbc3777a49a041109b8752d98d2ed/core/src/main/java/jenkins/install/SetupWizard.java

import jenkins.security.s2m.AdminWhitelistRule;
import hudson.security.csrf.DefaultCrumbIssuer
import jenkins.model.*;
import jenkins.install.*;
import hudson.security.*;
import hudson.model.*;

// Set Hudson Security
def env = System.getenv()
def jenkins = Jenkins.getInstance()
def securityRealm = new HudsonPrivateSecurityRealm(false, false, null)
jenkins.setSecurityRealm(securityRealm)

// Create new admin account
securityRealm.createAccount(env.JENKINS_USER, env.JENKINS_PASS)
if (env.JENKINS_USER != 'admin') {
    // Delete the existing by default admin account
    User u = User.get('admin')
    u.delete()
}

// Set Authorization strategy
def authStrategy = new FullControlOnceLoggedInAuthorizationStrategy();
authStrategy.setAllowAnonymousRead(false);
jenkins.setAuthorizationStrategy(authStrategy);
jenkins.save()
// Complete wizard
def wizard = new SetupWizard()
wizard.init(true)
wizard.completeSetup()
