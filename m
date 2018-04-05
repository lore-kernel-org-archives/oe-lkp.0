Content-Type: multipart/mixed; boundary="===============8004933364209031595=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, numa] 9164ea32f3: stress-ng.numa.ops_per_sec -98.4% regression
Date: Thu, 05 Apr 2018 09:04:03 +0200
Message-ID: <20180405070403.GY6312@dhcp22.suse.cz>
In-Reply-To: <20180404045507.GJ3101@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8004933364209031595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 04-04-18 12:55:07, Ye Xiaolong wrote:
> Hi, Michal
> =

> On 04/03, Michal Hocko wrote:
> >On Fri 30-03-18 09:35:59, kernel test robot wrote:
> >> =

> >> Greeting,
> >> =

> >> We noticed a -98.4% regression of stress-ng.numa.ops_per_sec due to co=
mmit:
> >
> >Could you be more specific about the test case please? What kind of
> >workload does it simulate or is it completely artificial?
> =

> stress-ng  will  stress  test  a  computer system in various selectable w=
ays.
> It was designed to exercise  various  physical  subsystems  of  a compute=
r  as
> well  as  the various operating system kernel interfaces. stress-ng also =
has a
> wide range  of  CPU  specific  stress  tests  that exercise floating poin=
t,
> integer, bit manipulation and control flow.
> =

> More info refers to: http://manpages.ubuntu.com/manpages/xenial/man1/stre=
ss-ng.1.html

Well, it would be more helpful to know what kind of scenario has been
tested and reported to regress.

> =

> And attach the raw output of stress-ng in this test.

Anyway I can see a lot of
stress-ng-numa: get_mempolicy: errno=3D22 (Invalid argument)
error messages. Are those related?
-- =

Michal Hocko
SUSE Labs

--===============8004933364209031595==--

