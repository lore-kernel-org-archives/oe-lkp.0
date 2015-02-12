Content-Type: multipart/mixed; boundary="===============2363017725509004911=="
MIME-Version: 1.0
From: Corey Minyard <minyard@acm.org>
To: lkp@lists.01.org
Subject: Re: [ipmi] d9b7e4f717a: +52.5% turbostat.%Busy
Date: Thu, 12 Feb 2015 16:50:49 -0600
Message-ID: <54DD2E49.9070402@acm.org>
In-Reply-To: <1423627517.8112.0.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2363017725509004911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm not quite sure how to interpret this data, but I'm assuming that
with the periodic checks it's waking up a lot more than it used to.

I'm not sure why this is the case, but it depends on what userland
software is doing with the driver.  I'll try to reproduce and see what I
can find.

-corey

On 02/10/2015 10:05 PM, Huang Ying wrote:
> FYI, we noticed the below changes on
>
> commit d9b7e4f717a167610a49ceb9e5969e80146c89a8 ("ipmi: Periodically chec=
k to see if irqs and messages are set right")
>
> testbox/testcase/testparams: avoton3/idle/performance-10m
>
> 6a11e5c67a397e9a  d9b7e4f717a167610a49ceb9e5  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>       0.10 =C2=B1  0%     +52.5%       0.15 =C2=B1  2%  turbostat.%Busy
>          2 =C2=B1  0%     +50.0%          3 =C2=B1  0%  turbostat.Avg_MHz
>
>                                   turbostat.%Busy
>
>    0.2 ++----O-O---------------------------------------------------------=
---+
>        |                                                                 =
   |
>   0.18 ++                                                                =
   |
>        |                                                                 =
   |
>        |                                                                 =
   |
>   0.16 ++         O     O O  O  O       O  O  O O  O  O  O O          O  =
   |
>        O  O          O             O O                        O  O  O    =
   |
>   0.14 ++                                                                =
   |
>        |                                                                 =
   |
>   0.12 ++    *.*                     *                                   =
   |
>        |   ..   +                   : +                                  =
   |
>        | .*      +                  :  +                                 =
   |
>    0.1 *+         *..  .*.*..  .*..*    *..*..*.*..*..*..*.*..*..*..*.*..=
*..*
>        |             *.      *.                                          =
   |
>   0.08 ++----------------------------------------------------------------=
---+
>
>
> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
>
> To reproduce:
>
> 	apt-get install ruby ruby-oj
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
>


--===============2363017725509004911==--

