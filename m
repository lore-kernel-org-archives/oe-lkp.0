Content-Type: multipart/mixed; boundary="===============0746645881964080291=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0b0695f2b3: phoronix-test-suite.compress-gzip.0.seconds 19.8% regression
Date: Tue, 02 Jun 2020 13:23:19 +0800
Message-ID: <20200602052319.GA24856@xsang-OptiPlex-9020>
In-Reply-To: <CAKfTPtA8bGTGr2jDiGqA9R_FAZUzFBwvthJmunDjBUdzQF3wJQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0746645881964080291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 07:26:01PM +0200, Vincent Guittot wrote:
> On Mon, 25 May 2020 at 10:02, Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Thu, 21 May 2020 at 10:28, Oliver Sang <oliver.sang@intel.com> wro=
te:
> > >
> > > On Wed, May 20, 2020 at 03:04:48PM +0200, Vincent Guittot wrote:
> > > > On Thu, 14 May 2020 at 19:09, Vincent Guittot
> > > > <vincent.guittot@linaro.org> wrote:
> > > > >
> > > > > Hi Oliver,
> > > > >
> > > > > On Thu, 14 May 2020 at 16:05, kernel test robot <oliver.sang@in=
tel.com> wrote:
> > > > > >
> > > > > > Hi Vincent Guittot,
> > > > > >
> > > > > > Below report FYI.
> > > > > > Last year, we actually reported an improvement "[sched/fair] 0b=
0695f2b3:
> > > > > > vm-scalability.median 3.1% improvement" on link [1].
> > > > > > but now we found the regression on pts.compress-gzip.
> > > > > > This seems align with what showed in "[v4,00/10] sched/fair: re=
work the CFS
> > > > > > load balance" (link [2]), where showed the reworked load balanc=
e could have
> > > > > > both positive and negative effect for different test suites.
> > > > >
> > > > > We have tried to run  all possible use cases but it's impossible =
to
> > > > > covers all so there were a possibility that one that is not cover=
ed,
> > > > > would regressed.
> > > > >
> > > > > > And also from link [3], the patch set risks regressions.
> > > > > >
> > > > > > We also confirmed this regression on another platform
> > > > > > (Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz with 8G memory),
> > > > > > below is the data (lower is better).
> > > > > > v5.4    4.1
> > > > > > fcf0553db6f4c79387864f6e4ab4a891601f395e    4.01
> > > > > > 0b0695f2b34a4afa3f6e9aa1ff0e5336d8dad912    4.89
> > > > > > v5.5    5.18
> > > > > > v5.6    4.62
> > > > > > v5.7-rc2    4.53
> > > > > > v5.7-rc3    4.59
> > > > > >
> > > > > > It seems there are some recovery on latest kernels, but not ful=
ly back.
> > > > > > We were just wondering whether you could share some lights the =
further works
> > > > > > on the load balance after patch set [2] which could cause the p=
erformance
> > > > > > change?
> > > > > > And whether you have plan to refine the load balance algorithm =
further?
> > > > >
> > > > > I'm going to have a look at your regression to understand what is
> > > > > going wrong and how it can be fixed
> > > >
> > > > I have run the benchmark on my local setups to try to reproduce the
> > > > regression and I don't see the regression. But my setups are differ=
ent
> > > > from your so it might be a problem specific to yours
> > >
> > > Hi Vincent, which OS are you using? We found the regression on Clear =
OS,
> > > but it cannot reproduce on Debian.
> > > On https://www.phoronix.com/scan.php?page=3Darticle&item=3Dmac-win-li=
nux2018&num=3D5
> > > it was mentioned that -
> > > Gzip compression is much faster out-of-the-box on Clear Linux due to =
it exploiting
> > > multi-threading capabilities compared to the other operating systems =
Gzip support.
> >
> > I'm using Debian, I haven't noticed it was only on Clear OS.
> > I'm going to look at it. Could you send me traces in the meantime ?
> =

> I run more tests to understand the problem. Even if Clear Linux uses
> multithreading, the system is not overloaded and there is a
> significant amount of idle time. This means that we use the has_spare
> capacity path that spreads tasks on the system. At least that is what
> I have seen in the KVM image. Beside this, I think that I have been
> able to reproduce the problem on my platform with debian using pigz
> instead of gzip for the compress-gzip-1.2.0 test. On my platform, I
> can see a difference when I enable all CPU idle states whereas there
> is no performance difference when only the shallowest idle state is
> enabled.
> =

> The new load balance rework is more efficient at spreading tasks on
> the system and one side effect could be that there is more idle time
> between tasks wake up on each CPU. As a result, CPUs have to wake up
> from a deeper idle state. This could explain the +54% increase of C6
> usage that is reported.  Is it possible to get All C-state statistics
> ?

Hi Vincent, sorry for late. I selected the turbostat while running
compress-gzip on Clear OS, as attached. Besides v5.4 and v5.7-rc7,
I got the data for v5.5 and v5.7, too. Not sure it's enough since you
said "All C-state statistics". Hope it could be useful and if you want
more data, please let us know.

Again, I collect these data on our "Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz
with 8G memory" platform. for each release, I ran test twice to assure
the results consistent.

phoronix-test-suite.compress-gzip.0.seconds
release		run1	run2
v5.4		4.37	4.37
v5.5		5.37	5.46
v5.7-rc7	4.82	4.85
v5.7		4.86	4.83

> =

> Could you run the test after disabling deep idle states like C6 and
> above and check what is the difference between v5.7-rc7 and v5.4 ?

thanks for suggestion, will collect this data later.

> comparing fcf0553db6 ("sched/fair: Remove meaningless imbalance
> calculation") and
>   0b0695f2b3 ("sched/fair: Rework load_balance()") is not really
> useful because they are part of the same rework and should be
> considered a one single change.
> =

> >
> > >
> > > >
> > > > After analysing the benchmark, it doesn't overload the system and is
> > > > mainly based on 1 main gzip thread with few others waking up and
> > > > sleeping around.
> > > >
> > > > I thought that scheduler could be too aggressive when trying to
> > > > balance the threads on your system, which could generate more task
> > > > migrations and impact the performance. But this doesn't seem to be =
the
> > > > case because perf-stat.i.cpu-migrations is -8%. On the other side, =
the
> > > > context switch is +16% and more interestingly idle state C1E and C6
> > > > usages increase more than 50%. I don't know if we can rely or this
> > > > value or not but I wonder if it could be that threads are now spread
> > > > on different CPUs which generates idle time on the busy CPUs but the
> > > > added time to enter/leave these states hurts the performance.
> > > >
> > > > Could you make some traces of both kernels ? Tracing sched events
> > > > should be enough to understand the behavior
> > > >
> > > > Regards,
> > > > Vincent
> > > >
> > > > >
> > > > > Thanks
> > > > > Vincent
> > > > >
> > > > > > thanks
> > > > > >
> > > > > > [1] https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/thr=
ead/SANC7QLYZKUNMM6O7UNR3OAQAKS5BESE/
> > > > > > [2] https://lore.kernel.org/patchwork/cover/1141687/
> > > > > > [3] https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLin=
ux-5.5-Scheduler

--===============0746645881964080291==
Content-Type: application/x-gtar-compressed
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="compress-gzip-turbostat.tgz"

H4sIAAvc1V4AA+ydeXPbRpqH/S/0Kbpmy1XKlIT0fWg3WyvTtMONrpHocaa2tlgyRduayKRWh2Nn
a7/7vr9ugAApUKQUWc4BJCJIoI/36gPhk5fDyYfzi9Hl5ea7X07PN6+uL95MLq+Or7598oAHp8M5
g7NwhtfP5fFEKGuN0txK8YQL7ZR7wsxDCrHouCZ1Lxh78unyePzulnLL7v9Oj+EC/380udu8GLqH
CIQ7+F8Y7cj/VrT+f5xjqf/Fr4+Au/jf8eh/ScVb/z/CsYL/pxfv2wccbK1e4H+htHGz/pdcWvGE
8YdUdNHxJ/f/1Lns4+ji8nQyZsLlXOdCsk22MxqzZxeTn8fs385G4zf/8dPoYjw6yycX7/59rXPw
qvd8nX+zxV6Oxten41FvfDU6Y1KyeIedjT6Ozi7/lb09/nB69nnrw+RkdLZ1eTU6Pz8dv2P8k90K
o61jtm63hPFbgn9TtCioxaOjrmK7+3u9/v4hO9r9kXV7R33W35Wsf9Rhu0eHbLtz0Nvs79K1opql
atsH3cMXG6z/6vDZ/gZ73j/aYAf93Q32/euD+DKeXJ2+/Rzf/nw6Ppn8HN+SRBtsb7JJb89/erfB
ugfP1obn13wLHQ1620oOdntHnUF3b/vZTneLROfcG/oLbL3f6STZqP7u6+1enx0cdl90+53vkxSl
Ug5Kvfxxvt0X3W0q1h109vf6h/s7qW2Kfs4NW9+ZDH8anbCyCf5JGGpldPxpMLz4TB4722KSjd58
GlxdDumttWw0nN4bvP+FWlsjc20xJYJku9//wtalTkOO0Ye/xirfUhvfMpEu17qCOd8cX44GH9CQ
IpHYB+o5ftKWPr25vkyfqG5NrWipg9f05uVuP+mjuRgOOVvv7h2/ORttwlyDzmRycXI6Pr5CwD3v
HaU7B8+m7/f3n32zdrh9QDbRXCl2ORrm7D8n12cj1plcU6RdsEMaj6MNRpFrDXt9fHV1WZPjYGe7
/2L/cHfQ23uxDzk8p3+Ufyu4gH3XPBmARM85+475eIaFSEc2evv2dHg6Gg8/s7cXo/+5xrs1JWvl
YY6iAmxUKzbn34P9193DQadfeFYOybEnbL0juuz4+mqyeX4x+TCBDbZKxU++qbURQ2hwuN3v7Q92
eru9aFD5Jv4zlCdytKZVTSytZvSII5tZdjy8Ov04YsMJTfMrVDB3raDnKuh6Bd1QQc1VMPUKpqGC
nKtg6xVsQwUxW6GyKA20F72Xg/7zg8He/m5vb7scc3HYsfUY8hcIy++U/Ka54k73792dgagq0mhY
v7WsXKlsbRLw07LsjGaB78TNqNju9Ht/R2TspQCZ7WJ3+0dScK8eQd/x1Bavt3Xww8tBB+MxiVET
QYxohqN/2fqrvZMRRelos6M2WPVBbLDa9drVszhvbTGaTDeHWFlGm2enH06vvvNb7Hoc31ZhfrC/
Q93FaWenyzr7h914ieFjUaRDpk5zKzScXuzWroryqqouimlRW12U04vusrqqVHnVVxf1tGioLpqq
f15dteVVesVcwE4uKPguttgplsTBeTTCXJF3EyoxnlCh89HF28nFh+PxMJaJd+sV2XgyiGGNCX1u
pm1eQIog2JGbBxejt6Or4XtWe795fnx6wXZE7abY7B1MP87Ex+7Mspf2a2ydlsp6Kfo46GwfbD/r
7fT6ve5RLCz4MW3jRmz9/em79zRM2btr2mfRPErzK41eCpOfmZhv5bD7t1fdo37ZmxyhgQ+nY9TH
8KbTyeiScUaLNsqwtI7HtxRvOM832dvrdw8PXx30Z43z/PRy8JIkOiZLj04GB+SEQed9WlJwr/tp
eB33Q4Pd0/F8m0d9MvtRrUHN1mkHsKg9urWwubhOdPe6hy//McD2ZfCst11v2WJSOkNwzCwNWBqL
5eXVXq/U7ZiPuGLrnHZvBlrGVXGD0QSJlkRaQMsLwbm4rM7PB6nVct0spkaaB7DKMpqoNhg6Jx9s
0t/rsnXqbXFj08VLS69OEENvvExzS5otptPBDy/ZDmYI9i806tOO4QRdl30UGvlanxtseHb84bws
3dCUrDUlpJxrC/JLrcVf6401LcfPD7d35xUytMCdjKqwmlcIdZIY1RIPB90UofTHbRIcHHASYKfX
+cfsXJCuzwi2WKQO1sSHlEkskEmsLtPLFz8+nERxSPW7uzSc0uzY3z582S0ksBr7P4oDeuncqHWw
3flh+yXV+L5Le8dqmHsvNJZDtu6XV2uacVTR4wa70TEFakcNeof96fTtvaZp7+Px2enJBnPBO8nG
l/NV7FwVZ6dVSEOvmuq4uTpBV3WMMKapjp+r8/Z4WkcaC/fcrBNm6wQ9nNZRKgTrG+oIPlvpzVtZ
CceVpmeXWEtYkQcvjRaIgzVEc0b7h2z747sB7QKzZ9eXn59mz375HD/RA1A89w7/lh3t9rKOoH+7
WUdlHZvRJiDr+KwT6Bqnv6e4Ry+K/uxT3KYXT38Bd/hT9PN0KNJJpZNNJ5dBkP6H8+zgp3c4UUQ/
vaC7dI5yTK7OnnZ4tj3+jBPu0omq4h3qPD0fyuKsirMtzq44++Ic6EwnEpk+Y2yg73imxuKZJp14
xgz8FJ8GT9c2s81MWBUy5XOpMpqJbYYnw0zbYCi+M07vhNQmC944FzLBpTBWZzRcjLNUQ1MBnomQ
BbqY01nnloqJXNNNlWubYYTiRUzf8Uxaclfmch4y6XJXXHUuczoLNjciU4ZK+ZBzk9mQCxIrV3Ql
1yITHpWrxppejMiVwitXuAAptKzur9EpE4601SK3Boq7pLgKFFa4q7R3JnNSeZk5I4TPhEGUZhpK
o4SEThqyCWqTbtAF16yuyaXLbE4VSXMyX7xKdrqprv5C6pKQVuhMudxaqGsKP3NtnYe61pEKXipp
M+/oiYvMQ0s8iQghVSagLrk0J6OQd42Dd0NoVjfk0q6R5NQnGYxiCz1NY4tMLFNoURAJ8roTLvNC
yYDyXFFXmfaoLalThGWuEHl5EOjUqIZOBWysyFO5Iht72C1etYHkcOQ66lBR0PGa7soHExx0d5Ki
1XMLC3iJMHeCLpKrFRkrC4hsepObGNkeEZAb2aw7JFgjwREuaBoxXu/TexvtHaCvp5PIvJXWwd7K
WdhbFOElMZroE+zN0acWzX3anNp3GGykui1HkyUxyIyWR7fr+vAm1TXCkMSQFC0+jnXvFMSwnoY2
hkchBcWhRvskhY1epwhoikGJQF5TiBVLgU5eV2amS6dkHFieRhP525K7PEnB4fXgKU5IGhLYItSk
nE4kKk0kC1Wn+w7Dj1SXupxISI4Ar/voAT3jAWfRGHUmHHldO42IDyFGPAkH1VXpgai7r7zOF+hO
w0qvUQnSxUGPOFZqutugotcdIs4rS3e8EtQa2YoEyjBAU5c0SMtBJmC/PKhFXZLpaDZRcTadzikk
hYBJdZzUtZsVQ4Zi4JHVPE38MIC1cJmjwUjBZ0u3o3M0Czmi2+WCqdzlwayZDKoohz5FqC8knAyi
U580lL3i5FXaZPAYJrSaQFoD5wv4XenC4PRWQHvpF4Y8jRUEO0Zc4RXr1mA4allG7TmfDUBHlxGA
OsD8GsPdagNJrEZUZ6FUvlrHfJx0lFjkBG7WvvZ/rn/w4y7f/+T/vJyM79FHfPpc+P0PxYq1c9//
0FOabb//eYzjf9cY+0vl4WIX/Zct9l90gzHsGOnNf2/MFoub7GmhuKNsKpU24dNyGKANxYo9etUc
DeGGYrSFr1pKe9aGUh1RK4TtbGOZ7rRQ2uw2FVKVEdJOuKmQnRYqtslNhdxlJVNjK74mM28qECpZ
GmUVvFKosQdReQtTXrNRqjKYERttUhWJ+/5Gk9SawVNBo8JVGcz2TUXio1YlNJ4iFhWrPIUt2KJS
NVfRc0hTqfQEVzXWVCg93lVlmqxdPPtVLonbpcZyM3FvmnxfPDlWwscnpYaC6dFyWi4+WywQrlaM
1rtmg6FcLWZ0kwLFc2sVE77ZS8Vz6rRcfIZp9sB8Od5UrnjOrcdQk6rFY3CtmI4Ty9r/fe1Z97dz
rLD+n7+fXEzGp582r0aXV5uX16dXo7vtBJas/1xwNbf+K6F0u/4/xhHX/yYPzwRGzvPL0XAyPqmt
ZPSg2A6m3/2xdPzLR+b/pEz8n2r5v8c4VvD/F+f/TJ3/A/8tuaRL7fz/CEfL/y3g/4T4QgDgTMN/
IAKw1OurI4ClIF+PAZxx8X0hwLKRlgJ8MAqwNOndMcCGmos5wIWFm0DAhsJLScDZ0PiVKOB0uHxV
FhBSLIMBUeYmDZiu3sAB4+UbPGC8egMIjFdvEoHx8g0kMF69wQQmKW5Agbi8jAqsl7k/Fjgz/bZc
YMsFtlxgywW2XODvkAusLcgrg4H1OiuTgfVKK6OB9Uors4H1SivDgfVKq9OBMsf3/MG0dOA96EAZ
UYpIjYUC6nA8GLBumTbGcTAcXIZgMmG4DRrkjVTxOvUIqsoBfJMlWAHAKgDxUSZ3TTRX5DusiMxX
yKQGFpLAHgU6qo7MOfA/N5C5ADZmCTLHc+/watxiQtAEAYBIRI7El/ia5MZGZA7oowtGu0xIx7Wl
UwBuRYYg61jSAtRcZEkkhLKolJsKpFGzKpvEegmo7EOyiRMrqCwfSGVQgiQ0qZyIPT+lBAF/Ap1x
QmXegWEjlb2gjqXXMIDNQmR5tEnclAGTBTcruNksgIdMHgk9AVMb9CtnTO1DcMnUVoFO1LCjdLSO
ol9nTOR1asCS1eiT9CM764WcGjA3AaYHdi4s4HgiBS0ZF/EeavFOckgXScGgwa4ZgX4kLQ8KJ27j
UAAmSZKT9hGdEjXteYP2EVl0PrGC1kZizvN6r4EbRAiZhQZcRkYP0F5ag3gzirSnQiWqJnwWocSE
iy7qNKqPcOHAXkl9UYSgkwUtKCMt6P2s+h6IFd1wCqimDXC/cWDmyDDkMxiNFCEXmhKbc8n9GrKE
5oBMsGRCBmnAqIgwzrifngpi2HGhM/Bb0d60rMP9HNanYcYjKOpLdi7EENCR9+QLZ5cQCTvqlGxg
CljUqYQNzthgKgvNZyYNARmJSYoQ+F7aOBLAs5kMmGQCB0EGh2gBEhHznJ72L2clMSU4KCOsGOyM
5b1JlveG7Om5J6eT5UWcaxwgP575ElaM5KCqws7bRQMArXB4hbQveVFrS3QQtV0EHushwCO9qTnm
9CCp9xgCcSKwSqsawkiKGJgWykf324WCUKcRHfSR0QReqSWw2TTr+GDjrOM4CexFjDcqij6FdbBU
RjrSiFSytDkQXZ/jkqp3NjPR0nrioT9NW1Jhco/en8KDhsTFNC1nJv0SC7eObOKCjGHnPByhhMCa
R1pbskEMRIhi4wxAbgN4vAAMD+SE3x4/eJfvf74Y/+fk7Pd/4P/a/A+Pcizn/5pYvBv8XyN/08D/
NdFZ9+H/0q50Cf8XN6xL+L9iO7sEAEx73dsBwGIjvAQApCn1dgKQ9tC3E4CNyFmdAKTt94MggAuw
yBoCiJ39EgQw7vsfCgG0C4vVYU16kFiBAcSTxioQYJPw8xDgArjvS0KArpmg+y1AgLQjW4UBxBPK
KgwgnmFaBvBLHSus/4/L/0X+Q9FGq13/H+No+b8/93HL+DcPlQQUY3xl/k/TdWF0m//xcY5b/f8A
uR9x3MH/kivkf6Wdu2j9/xjHEv//avYTx+3rP3lez/vfIQ1su/4/wtHyn4v4zy+VAHKm4T8S//lb
SQFZCvIV+c+HSAJZNtLynw/Hf947DWRDzVv4z7skgmwovJz/fMhUkKKGZX1F/nOFZJCiMRukaE4H
KRrzQYrGhJCiOSOkaEwJKRpzQormpJBihayQ9TK/gv9s80K2/GfLf1Z9tvxny3/+PvnPeySGrNdZ
nf+8T2rIeqXV+c/7JIesV1qZ/3Q8V8ZLZVv+8878p1G+zGIndJEkUSslHTJzZc6KgFyB9OSjwOZZ
j/+Ik1masbUEEai4BqbngHGqzIA6c2DuAKAJ4De6IGOEzl2djFI8YWSA3Tw4IpE4NR1hUoE0gAmH
NKCdrAfR5Xxk71zCbVRz4rTqRceMcVTcgLWMGeYaEFDQUBb8Fulf5pCz3EQayCqDTIX05I8calpK
JDOzwvnMZdIYb0ADSVIbzBBeoLaC2spP1fZzavNIsUW1ZTQUV4+stgXIG9WWDmqrQm2nU9ZAS85H
ZjhNqpIGHnnVjNXAV0ltqROSaZC70COLIdICSWjN7VRrK2a1NjxxoDraF5RcrWMavDEnn3ExOyMX
3lD/NMLpkzU+Rgf1bJXNwG1m0agWqfPIfMaDNBNV174OoyoJKFbBLcKB0w24b2WiQSNkplL02zJF
qJWJBjXG8ChNcIlIQz7QoCUkhfdlNEMk7GzuFdmCXsiHglei1BlV8KAh8aAaWetMRBAprKZRx1Oq
QEuzPDoUwlBRZ6mY0Y6UJ0NQxzQy6QL1KST1aaako5xiaCJC2DP2pzgw4NYo6lTMaEoxYlWCQrWN
DCNSSAqAlcknQYYYDCEgsAFpoWFPRTAGYo5FaZwIMZekzUGOIokgEgrGkS/DVJgwNwS8S1Soge4u
JiCklsuOHffRDEKB9uO0qADCM5JiwgQO6hJhaDF9kD9ILYMUkYCUOQJaaqDJUw/oejBwDEyNmQeT
Thx9FHhWF/kkXWSUachpYaZ2sC4mjSSVY2w64TEhahosFK8eFHJ0ioh2MJCDhIlTAbkPM2BlBz8H
B9LzYmRDy9HoZweFS3bQSCIqyANxEqKoBInobIQxDfemHI0UFsCEAcN4dGwqKxgzFw2qSPrp4TfM
QS6LGS4BiOoQ+WoRh6iehgPNhZDGSMxdAsldIQ1SvWJKdBSRMINEdk0b58QYEJFEJSfAEL4pOqNX
jE+cqNGRTk/TUjkeHflcxq4D+hQi/i8ImmM6ME5JAMHkdUwW1J1B34FnEfAtpoc4/Mu+uZ/tG51h
3UJEUBjk1mNgFKwoEk3aYpyW8tCaEHO4Wqk8ZqBgEEm0OhiSx9JHEoYk0aBQab6BayCOi+L4tCqK
yhR61jXWfnFgdNXvf+7LfuKIT5m38J9aq9nvfyQ3os3/+CjHMv6T9oTL+c8Fafdu8J80bh6I/0y7
0tv5z7RhXcZ/pu3sEv4z7XVv5z/TRngJ/hkaCcaK/kx76CUA6LIUkLI5MWMNAMXmfBkAir37MgCU
L0AyawBo3PcvAUDjA8FyAhQT9HIAVDfzgnP8Z3zQWFTM1TVsdPs8JbqAeLxzqsi47X84StQ0J2ad
p0TxaLGcEo3PHitwovHpZAVQlDcjrPOgaHyGWQEUjU85K4GijRjrnxQUXbL+/2r2E8eS9b/Ofxbr
P81gvF3/H+O4N/9p6GnhTzA+/ujHreP/AXI/4sAYX5n/Mzzxf23+x0c5lvj/Ufg/I9yc/2kP3Ob/
fZSj5f/a339uf//5Adm/h0D/WvKv/f3nVLb9/ef295/b339uOb+W80t9tJxfy/l9Hc7PJc6Pum9/
//mr/v6zE7lVlpNRWsLvzoSfjunOZJ1w00Eb6RLiJvAzwIKelCJnE4RUBgkJOVLzCSsBYGXCyUzG
9GsSzBF+v1QB/1JlIsOm1FfxFzzxo7URLUp4HzVnYwYzV3BuEYXDl1Ei8xxJuQxPAJWoA0wLODcd
OTf//+2dXZbjqLKFnz2ZXBAEf8M5L3f+Q7ixN5KMbGypXE5nVTWctbK6siUDQQRC7e/sjV9QHXGA
9zkCHKod2qTeC42BowjIGtUC/MOmDxkyKO9B7AtoB8yNmz1xY/UCmBno3V0ZvBuyyYP0gPRebMOC
8NhozuVuzv49cwbbl7jgmfzO6tMqkLMk1CaF5BWMr23OAJhyCRnG1xX3QeFRwYhRrhBT5jJ7N1hm
D1feEhaFR0f5S5E+1LZ5ROJJEsiv2UYANUAPR+QiAQgMqDb8oaDH1txqfFzOwyg0gCmTML1KjCZd
vKATKa4ceqLV5UigNdp7PHVMY6H+Z7U1zrnWsClNKhiqggEgxRVzl7E/t8D4euH5rJagyYi5h01V
s6Y29wAJRdtsPfIgJXsWUeuSaoqE2i70xbW/0UrbK6YXCNPuYr4EPnhMLmNwNv31t2n1g/aRltwO
ENsqtWcJT4QqeodU11IhoxhztYXK0WXpp49sr1wFG1wIm+3y/fRDbBxfpsc66kQhnblOHzQYHOYT
dCs1pkqOL9EHPuW69Rkg0Ui8tVmPW5/hoaRgBfnoqO25Oq1nt/B7jsp+MPXeMDobhiOwqjUAHbRa
h/FvVPF0Qk9QgLUYUNwSQ4F/MQRpsfoNDZYt9rtiF/geEt/TQq1bWAn7UK/90gncKg0QnCUe+FnL
iAStQ8CMATkLXI6rb9VZ0QMINbkKfPp9xa3gdCbjl7Z/n2WB96IPq7rhNQbeLdmPbcCuic0J3P4q
VvzRc9tA8JgAHAlBQIpb7ujBnbhl/dK6cHueVG/0fe2LJSCTjottIXdA4FKw89gidWmZlUm10n5d
mXgVka+suzIW1QTFSaCu0hV+EdKl1GRj9uRKdHdZQEFjDAJjoR6tPd2cLZpVAfjrC9i+NhJ7KlTi
oW0j0t4T/Zbmzn+evuNRO/v9z3fyfyH7/fc/9lPm9/8faYf839Cx+I7/GxI6A/5vxA+9wv+1M+tz
/q8dZ4/4v3bYPeD/2kn4Of/XjskH/J8fo4ad/GM8kH/0Y1Kux//GYJvvtR3Huo09/ofT1xH+h3P/
Af7Ht4ID/M+d03/EW8Qx/pcfWE7fyD/GB+7Vt2DfKE43YF96pLDYg308878P7NMxYjcA+x5pU3aX
8cXjBNiHV5NTXN9QXXTA9Y3d0O+5vlFJDLC+SfX9ejt4/n+e/+PzX+ygPJ//n2i/wf+1fXZW0l/d
num//oT+o/1B/UeNk//7RHu6/p/Xf/Sa4f8dk5v850fawfp/hv+M/fo3/cc03/8/0ib/+Uj/8bvk
H/9N/vOPMf/+af7zLdbfk/98t/Ljy8KPv6L7+Cuyjy+oPr5T9PFP4D/PWH4PFR/Hgo9Dvceh3ONY
7XEo9jjUehxLPZ5QenyL0OPkPyf/OfnPrc/Jf07+8wP8Z1h0Hv37dB5fkHl8ReXxFZHHVzQeX5F4
fIH/TPD/lZKmw/cLDt9K7+EQdn6vmkHiuUtxGYawKdhfI1itZsJbS4QyoysX270hgghsL8KRGjpt
YGPCYsOcZKS15i7igFLRH1sK2EcIxwhIqxzgd51loSETxLlSszWGQ6wszs2HftdK91X72YTFgOho
J47YAFDMKlDZq5u9z+IorVa1QDHMwRK2eAqG5ZhhPCuanS50GoxkASbxnwCYrWJicdNYW6ccYQke
CMcpZfZitF4GU9ZvmjIIQ6XFtX1kN+UglTbWKScbTFSB8qHL8BP2PtNmWkRt+DZX6CXiM+juDJIQ
Yk/xKqB2s8whrxbfAzd1n3wzD7ZuIWNIvdESYPHsLPq4DbH29VIviAbs6CGc1xItL3hXi3XY96vS
vKilAp2E7J1ebb4Xj+e8W/ZUHYXbood0nAZYCjuvsB12EaznBZJuHn9i5kACicABRO1cfqFo2I8F
1u9xMfr2FLBL+35zobmypZt9WvQZVG6pAkP1ohZZSxoFuOfh+E3sEFKaVPBrLN8agl2CiP/KdKAv
cNr2lF608GW/gKDFPocO3bsQJMKeKRUnl5g9rJRrBhLpoPHXNAVZHC0EmD0igowNV+E+T/XP3XL4
urf63odAa5MPTFqgm5gguWlPFqafZ2ZKcFWWigu6/kjMgnSVDtR8k31+ywKh6iLYWFmA0Eqra1jH
9yFQz+KP0TIqWqogBJDetCwgqWvxVLqw0/E+gP8N2EEoIwjwqVxz0u1Hk8Ki6JgIIWroa0GsChHh
nDOECoPn3uToVl0TTKURdYdtqELZkuHeVcMKA1vPfodiRmwufiGiWypYWuRV0rEiC7R5fq/+2zYW
bYSqVab1bYcBm10ItkNXB2YVS1K9LK7fBZs5ZkU81W/VaEPZ2W97q1nfqNDkuXXEXQaGmIn+plpD
hl5iwUakHhqjEcKKAO2rQ2bgQXRpEDYtz9l93fRdbY617OsBXDCm3yDZiodPjgsXmgCmNindPhmC
X2UtrR58RQzsXKXUdeRuYWEqeclL7ggO6QBoO280KMTMbvJS6h8Lhp79/ud79R9l//0f+M/p//WR
duj/fYb/LGMlt+/z/17OrM/5z3acPeA/22H3Of7ZTsLP6c/lmHyEf47NvUtH9uGE/ZwAfTDvK89n
T5wDABTPkCMAFCf7AwA0PJBa7PlPvBUc8J98XTgBgOIt4hgAlbEY6S0AWsY85r3+43j4t5zoKIVu
BSAfCDve2oQPmdMXOVG8UJ3jRB8wlnubcHdG/xFvMCcwUbzjnMFE8ZpzBhOt45we+ISPJjEARcN/
AW87eP5/mv9s/Ifgv8fO5/8n2u/4f0/+8+9vT+v/8/qPPoo2/k8m//eJdrD+n+H/1N+s/+T/PtUm
//eA/wvfxP/1n/sP8X/hD+H/wk/zf/36vsr/hcn/vZn/C6/yf/c3Pub/Hl074v/urz3k/3ZZ8Zv8
X7giOj/H/4Vj/i+M+L8w5P/CiP8LI/4vDPm/MOL/woj/C0P+Lxzzf+Ed/F+/007+b/J/k/+b/N/k
/76d//vfov+ob+P/rs/g0/xfd8tp/q+75zT/191zmv/r7jnN/3X3nOf//FdWtRWZ/N8L/J8j9yA9
+1E1elq3xpwLpLBEEwgdrZU+r16ypRcksST4CJU4oQhkoNQcOCT9as7JK/zhpWkYbgiEwBi3kW2l
icqlTAHIAhauuI2FKxSALECZKn7APfPGsvQBC5eAySyI2AP8b8RjSXLQl7toCpD5cwEmpupS8pca
rIpwY81wMCb5YoNKoPn0q6mcrdp0NmPdQTgkhYQO0BnUVgE0Q7jxUzNu+oJY7hz75Q61GVprUWKJ
sQLPUhjs1hBTArpWFaPH/zi+L+pAFlJf1V/XOO/XWBZf55ibU6rsAl0L+SGNEcCfL0o40IZjmeXR
nf22Johw2hB8Y2voH06PXihAxq3nsIs15Q89HZcV4J9lly1TbPQfPMs1UipTqt8Gk8m3AX0E4gRP
7wC9qItVAG18fclhXfQIL1+I+RE68kj2FTrKvTahh1BcY/9iJq4HQLMLQXTAYi3yqQIniyXD3LYE
G4IFBQqbF3EKTcQGXnqYKWPkMEXHN+lli8CerxXAZ4IMkIq41S+LYKoN/ouVEJ6EHfCVHG22FXwX
xpKD/UVhMw38LGAITuDh3PK+wtYZGJpyYnKt9FT2I3GLEGSsdQHk+hBoYnjteKro1vpTwH82+Zoq
NDEDdGcTTK1F1hAA2vtq1SvXEOzVIJcQWCyFrFdB8Fc1yOTLKoPah0CxS10iZQJRCFC1FQh1Wg44
op/24LHbLwDOPDc7mCUH6RU5bST5phBcauTfut3uIx9SZf1l4J4WAmeDsx3H4lLxBSh3nJRX4Jh7
rDAH2h6r1yq4yQHAn3S9LlgqKkhuWpDJEVeEpms3FA2SW0ImRECBvKm3Sr3AyDgxAvB4R2Fww2dC
liaL2Hyhtxj0orDwH48L+Oe4brrDDW3ngZIoIDt6TodMqdii8FDGjnQBeQ5N0gt2htjA04TIt0Qo
i6QuwL6a9mEA+Ig8gASvNjdwC8MC/glroe5XJMLbGisiVgQ2gFBg+w1k0ZIS5QFN5LTSjxUjkUWk
FilZt+0g1P1QvP9jwb+lnf3+51v5v5D23/+Ii2F+//+Rdsz/jUCjO/5vqCd4z//VIbX0Av/XzqzP
+b92nD3g/5bD7gEAyJPwAQDYjskHAOBwZj3/xxP2c/7vUADykURkD+498MW+XpKGdFZP/+nYXPiG
/nPDa3r6j9vkMf1nG/sZ+G/Int3Df+Pk2cN/eEs5w/6d0Yh8hNfdsH8PLnsN/Rtm4z36N1TVvEH/
8HJyCv0bCsEO0L+hyfmA/RsTn/fsXzhn/TzZv5t28Pz/OP/Xnv+T//tU+x3+7z9TJP9we1L/+gP6
j2Jvw9R/lDT5v0+0p+v/ef1HsT+b//dc/4+0g/X/EP+p3frH5v+d5vP/E23ynw/4T/km/rP/3H+I
/5Q/hP+Un+Y/+/V9lf+UyX++mf+UV/nP+xsf85+Prh3xn/fXHvKfu6z4Tf5TrojWz/Gfcsx/yoj/
lCH/KSP+U0b8pwz5TxnxnzLiP2XIf8ox/ynv4D/7nfaP5j/rY/6zTvxz4p8T/5z451+Df/5fwz9T
fRv+eX0En8Y/u1tO45/dPafxz+6e0/hnd89p/LO75zT+GWG5bDOc8o+/jn/mBOTtS33vB+yiT0rt
L8u0KKDhAoTuUs5BLiXWIoXqjwG8EJXRLgLtOmB52jBHCIJ1bFa+0ULzFEAE1Gjbb4kE58Il6wUG
xAS5SEPWiutS/irlUjL4rbjInJWxBfD1R/RgvrSiY9/AqHsAFAqHNv3M6a8oYFAFWAhPYPg/RyuD
S3DeRpZdApAGwDCHRIPaeqHYmkL2UWDya7N2w1l7SpBFYIngZoHG2qzVXZIbzLp0s67vnHUCqQum
i8prmwd2iKggcngwoi4eepdBMZ6sBRqgNjOoH3rKHyqsqBVUZeAi5g09w6RvKVDfKNAssIAGHmj9
rrJ3QQo5Ks1VoccmkBJ0BC8lq4L5k4K8k3wpa4oFcqiJ/a7BLjf0qWeEQaEJhSMtwJIgekcIlHCj
X3yA07byvkGgudjMcoTaXfCxWGYGuIBbh8UXZg4AUL9yzuhJOh3CvCkhukXvreZGgWaLqtr1uas3
6zZTS04TpOVyyDZOS4Jq1VAzFFLBBbtYAN0x9K4RsEKFx4Ra2/q9UcGMyLeohCETQ1BghU4KNOPj
PPDAfjk0t+WooDVtTRJGWWDBLURxwd/RsttfaoNgFSif0HI6YyfZluMG+F78wAVey1pgpK5ItYX/
szMziHP1Nq5LCk5B+WH2scKbHh+eLPQZCUiVURqQC/hFoQ39GoKdBKQNA8QqdWbdF1UbiV1ro0Cz
YyW41FeCukwJyJiy1U7xmebfUYXLIeBQS6MyC9jHDBAa8odZsBh6XYy6y0eL1eIInulB/kWk8Br4
YA9P5h780nOkQCfMuBF4rD1ywFIegChyD1EQxp25t8KWdzmw7DmxIkzKMrBgpLhQoNlj+Yns92Mp
3Au0gHPPsEO3CFQwwKTCocqaa2ISWN1Hygfj/0PQRlP6HTBdR8Md0F6YSYFCVRYFuMs+jQ475iXa
60rgZmBBcGrDtqA0/VENrBU+bgDuowD5CJG6sdc+QmV3T8KCB4f+Lm3LveNzRRcGNOMBIG1julal
PfQaFZ/Ai4YEvt/xkSABH2erXRYV4GUvQJat67Hi0OmGRvW2dH80Anr2+5/v5T/z/vs/6D/O738+
0o74TzsyHvKfPFKe4T/9GF17wf+7HVoP+E+eZw/4z3bafY5/tqPwc/yznZMP6M9D+cd2xH6Of9r5
+4D/lPGEOv7TDlZH/CdO9gcAqDyw9u4AUL4VHAGgdoY8wX/6J8benVX7mCy8BUDxDDkGQPmecoYA
fQA97gjQUX93LuEyBHNfI0D5OnWCAMWbxzEByheyEwgoXl5OIKBujJ3eEqB8wzlHgD6I7+4yvCRN
ALRvB8//j/t/k/+A/7fO5/8n2m/wnyH/R2rkX25P6//z+o/iU2j8X5783yfawfp/hv+z3LiuvzT9
xzD3/0+0yf898n/uv+F7qwF0/8H/EAG4zuvHEcB1ID/oAb37dvhVE2g3KcB3u0C7VzHAwZ1PfKAf
XTw0gr6/+NgJepcav2sF3fE6P+gF7U6YQbuhG7Qb20G7oR+0GxpCu7EjtBtaQruhJ7Qbm0K7E67Q
7i220P32O7nAyQVOLnBygZML/GYuEN/Skws8vu20LfS1Ts77Qnf3nDeG7m467wzd3XTeGrq76bw3
dHfTr9CBUbKKm3TgL9OBJUUag5KLyCsdqJZogB4ylBHhNxwKhACDavSXkqoTuRTIDIYUIWoH+gjY
UqFyHhAJOplu7siww+xRIV9xqQenYf8Kfqd0mgUcmImvFGJywdNhMxV8ZiEBEzMudPjFISYH4bAK
LUPfetdOOq3BgdU+RnNjtcChLFqJqdKg1AMIDLlAXU2zh0m2YHx2iQP+QirEwRtaaXQdgH6UfCXC
bqZc4dDaiCXXjJRtbn4w5fBdU042DCxwhm5ih2bFBObHPqG6CiXMCNQxiy1xSpiqTVk89BbxT9AF
FIBWQipMNgQUZryyn7JPjQusQIGaipyPG4MURdhrrAXyborPjKXaOAuGCd3FQldkQEBKsUMASJ6g
U4lbr76PArA05lZkbilySy2iuVGBBda6gSKNtnGsI0niaFKtClvs4MjAFQUbKhIpTWkJIpfaSCCI
zSUEIAqor5VHwxr3Gp7o3zUqEHqPSjCp7xZIA7p1xaaOsiMGCJf0UCXS/VZgYB4xENQXrMIj4Fuw
cwoebe0o5cZf8QfqCzQU6DHCgaivqzhkAZ2miKPS030ZTCwt7YMDtgYdSCkRdJiVPXUJffWkqaCW
ig7oBywQCoXp8DULOkozcCzS1CGL0oU4MPa6kWi6BEECNRGxKZQIKtX2eIwoSODquLVX4KhMBeiR
bL1q3OceKDYylDQGtwjY9LJvVOCSBcXtRwL6zkZiS47QgJa1QyojgBEoaWglTwYmEpBvEx5EBHQD
wsRvdFxD4iwiCxdYwMey8Ps0CJ4+zMl+VaGVCsa4CtKAo4P/s+UnQkEGjShi22oJHbprFkjap5+r
bSewIYHiJiW7mUKvg/G7NEDNMQjeph8qxWFzSYFpsOSkhgb4XSi9ugqRKgeTrmTqDanqFy6wgEhX
oHxdv/bhwuA7MKCWcBWYtLeLcoIkLytSAvMXjxoYRQMtFFSf5KsMcd4bk9ObHUEQykSSyLadLPsF
DCyUQAU8uCtMDVwRqZWFCUvwXBolXIQ5KeJXMHALga0R1GivIdCbEITyJ4CBZ7//+Rj/h+//pv/z
x9oR/1eG3NIN/6djgmjA/43AtJf4Px5Ln/N/7cR6wP+18+wB/8fD7gH/x5PwAf9XDtQf2yH6AP9z
w9H2+N9Qg6/H/3SoM7jD/3B2P8T/hv309B+O/Qf0H98HjvE/HB3O0H9j9PGG/nPjfL2l/8IDi+hX
6L/RB43ov7cJQLYXphP4Xxmv9AD/O0f/DWN2j/8NOx3gf2Pw9h7/G4pd3vN/w1wb8H/6H2GbDp7/
n+f/wH+A/4vz+f+JNvm/2WabbbbZZpttttlmm2222WabbbbZZpttttlmm2222WabbbbZZvv72/8D
qb6Q5ABoAQA=
--===============0746645881964080291==--

