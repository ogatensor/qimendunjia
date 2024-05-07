[[Digital Systems]]
[[Developing Time-Based Security Controls and Anomaly Detectors]]
[[BAGUAZHANG]]
[[PROTOCOL]]

[Skip to Content](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/c06.xhtml#main)

[](https://learning.oreilly.com/home/)

[](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/c05.xhtml)

[](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/c07.xhtml)

# 6  
[[HOURS OF INFILTRATION]]
After waiting until the hour of Ox, the ninja realized that the guard had fallen asleep; everything was dead quiet, and the fire was out leaving all in darkness.

> For a shinobi, it is essential to know the proper time. It always should be when the enemy is tired or has let their guard down.
> 
> —[[Yoshimori Hyakushu]] #5

When planning theft, espionage, sabotage, assassination, or other attacks, shinobi were not burdened by the spirit of good sportsmanship or fair play. To the contrary, they carefully considered the most “advisable times and advantageous positions”[1](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/b01.xhtml#endnote-45) to strike. [[The _Shoninki]]_ stresses the importance of waiting to infiltrate until a target is distracted, lethargic, likely to be hasty in judgment, drinking and carousing, or simply exhausted; _Yoshimori Hyakushu_ poem 63 states that one’s tiredness “could be the cause of a serious blunder.”[2](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/b01.xhtml#endnote-46) Shinobi were keen observers of such behavior and would often infiltrate when an enemy was cutting down trees, focused on setting up their own position, feeling tired after a fight, or changing guards.[3](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/b01.xhtml#endnote-47)

In studying their enemies’ behavior, shinobi noticed that predictable human routines created windows of opportunity for attack. The scrolls divide the day into two-hour blocks and recommend planning infiltration during the blocks that tend to align with waking, eating, and sleeping. The appropriate hour depends on the type of attack. Night attacks, for instance, are best undertaken during the hours of the Boar (9:00 PM–11:00 PM), the Rat (11:00 PM–1:00 AM), and the Hare (5:00 AM–7:00 AM), animals of the Chinese zodiac.[4](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/b01.xhtml#endnote-48)

In addition, [[_Bansenshūkai]]_ notes that some generals believed in “lucky days,”[5](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/b01.xhtml#endnote-49) divined through Chinese astrology. On these dates, attacks were thought predestined for victory. If shinobi could identify enemy commanders who believed these superstitions, they could use that information—for example, by predicting troop movements based on what the commander believed to be a lucky or unlucky day to leave camp. When it comes to predictable patterns of behavior, not much has changed. In this chapter, we’ll discuss how the cyber equivalents of time-scheduled events can be targeted by threat actors.

## [[Understanding Time and Opportunities]]

Because people still rise, work, eat, relax, and sleep on roughly the same schedule as the feudal Japanese, the hours of infiltration suggested by the scrolls align closely with when employees are distracted, exhausted, or made careless by the challenges of a modern workday—in other words, the times they’re most vulnerable to attack. Consider the scrolls’ time blocks in the context of network and information system activity and usage patterns:

1. [[Hour of the Hare]] (5:00 AM–7:00 AM) Users wake up and log in for the first time that day. Automated and manual systems boot up, causing spikes in event logs and syslogs.
2. [[Hour of the Horse]] (11:00 AM–1:00 PM) Many users take lunch breaks, meaning they log out of their systems or are timed out for being idle. They may also surf the web for personal reasons—they read the news, shop, check personal email, post to social media, or perform other activities that might trigger anomaly detection systems.
3. [[Hour of the Cock]] (5:00 PM–7:00 PM) Users find stopping points for their work. They save files and perhaps rush to finish, greatly increasing the risk of making mistakes in both their work and their cybersecurity vigilance. For example, a worker might unthinkingly open an attachment from an email that seems urgent. Users log out of accounts and systems en masse, but some are simply abandoned, left to time out and disconnect.
4. [[Hour of the Boar]] (9:00 PM–11:00 PM) Most users are away from work. Whether they’re at home, out socializing, or getting ready for bed, the security of their work accounts and systems is probably not at the front of their minds. Organizations with staffed overnight SOC coverage typically see a shift change during this time, creating a window for attackers to strike between user logins or while SOC users are getting up to speed for the evening. The later the hour, the greater the possibility that users—even those used to late hours—get sleepy or let their guard down because things seem quiet.
5. [[Hour of the Rat]] (11:00 PM–1:00 AM) Networks and systems run backups or other scheduled maintenance, generating noise in network sensors and SIEMs. SOC users might have completed their daily security and maintenance tasks and could be immersed in project work.
6. [[Hour of the Tiger]] (3:00 AM–5:00 AM) Batch jobs, including processing log files, running diagnostics, and initiating software builds, typically execute during this time. Aside from SOC personnel, most users sink into the deepest part of their sleep cycle and are not active on their accounts.
7. Lucky Days There are also specific days, weeks, and months when adversaries are likely to target systems and users. While most organizational leaders don’t base activity on “lucky days,” threat actors are certainly aware of regularly scheduled upgrades or maintenance, when organizations take their defenses offline, and of three-day weekends and company holidays, when systems and accounts go largely unchecked. If potential threats have not been considered, irregularities in network traffic and system logs could go unnoticed during these windows of opportunity, allowing adversaries to conduct attacks, perform reconnaissance or [[command and control]] (C2) communication, spread malware, or execute data exfiltration.


## CASTLE THEORY THOUGHT EXERCISE

Consider this scenario: you are the ruler of a medieval castle with valuable information, treasure, and people inside. You receive credible intelligence that a shinobi plans to infiltrate your castle. Imagine that your guards have perfect knowledge of time but can enforce only the following rules:

- When any gate or door (interior or exterior) can be locked and unlocked
- Curfews, after which anyone found in the halls will be detained

Consider what level of integrity, assurance, and security you might achieve with the strict exercise of only those two time-based controls. How would you train castle residents to operate within these strictures (how will they use latrines at night, clean the premises while others sleep, take night deliveries, and so on)? What compromises do you expect to make for your security controls to be functional?

For this exercise, it is useful to draw a map of the imaginary castle or your office building. Or you can use an abstracted layout of your network map or data-flow diagram (DFD) as a “building,” where switches are hallways, routers/firewalls are doors, systems are rooms, and VPNs/egress points are gates.

## Recommended Security Controls and Mitigations

Where relevant, recommendations are presented with an applicable security control from the NIST 800-53 standard. Each should be evaluated with the idea of hours of infiltration in mind. (Note that applications of these techniques require that logs and alerts have timestamps and that time across all systems be in sync. See AU-8: Time Stamps.)

1. Evaluate your hours of operation and perform threat modeling. When are you most vulnerable to attack? What can you do to train your staff to be prepared? [NIST SP 800-154: Guide to Data-Centric System Threat Modeling][6](https://learning.oreilly.com/library/view/cyberjutsu/9781098128920/b01.xhtml#endnote-50)
2. Implement time-based privilege controls on accounts based on users’ business and operational needs. For example, restrict certain users’ ability to send or receive work email after 7:00 PM. [AC-2: Account Management | (6) Dynamic Privilege Management]
3. Restrict the ability to log into or use specific accounts during certain hours. For example, when there is an attempt to perform unauthorized actions on an inactive account between 9:00 PM and 11:00 PM, alert the user immediately to verify their identity. If they are unresponsive or their authentication fails, alert the SOC. [AC-2: Account Management | (11) Usage Conditions]
4. Leverage heuristic analysis systems to detect abnormal system access or usage patterns during set times. Users should voluntarily document and provide insight into their “typical usage” patterns to help model their expected behavior during their workday. [AC-2: Account Management | (12) Account monitoring for A-typical Usage]
5. Require system owners and users to document when systems are expected to be in use and when they could be powered off. [AC-3: Access Enforcement | (5) Security Relevant Information]
6. Shrink the time frame during which adversaries can operate. Define a strategic enterprise policy whereby sensitive or proprietary information should be accessed only during set times—for instance, between 11:00 AM and 3:00 PM on weekdays. [AC-17: Remote Access | (9) Disconnect/Disable Access]
7. Inform the account holder when they have successfully or unsuccessfully logged in, including the time and date of last login. Tracking this information helps a user alert the SOC if their account has been compromised and tell the SOC when the unauthorized access occurred. [AC-9: Previous Login (Access) Notification | (4) Additional Logon Information]
8. After establishing times of operation, configure user devices and systems to automatically lock at a specified time, terminating all sessions. [AC-11: Session Lock]
9. Document a policy that communicates the times and dates that changes to infrastructure and systems are allowed. This assists the SOC when evaluating network and configuration changes on an hour-by-hour basis. [AU-12: Audit Generation | (1) System Wide and Time Audit Correlation Trail; CM-5: Access Restrictions for Change]

## Debrief

In this chapter, you learned about the traditional Japanese time based on Chinese zodiac animals, Chinese astrology’s influence on divination, and how shinobi likely used these to seize opportunities to infiltrate or outmaneuver a target. You have considered how network activity may vary depending on the time of day and how you can reduce attack opportunity through time-based controls. You became familiar with the shinobi’s security standard. Specifically, you learned that a security guard was expected to notice the smallest incongruity in their scanning sector—anything that might indicate the presence of an adversary. In addition, you reviewed guidance on how to apply some of these concepts to your threat hunting, security operation processes, and anomaly detection systems.

In the next chapter, we will review an application of time confidentiality, keeping the time a secret from malware, which may allow defenders to exercise particular detection and defense options.

table of contents

search

Settings

queue

back