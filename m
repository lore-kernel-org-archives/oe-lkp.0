Content-Type: multipart/mixed; boundary="===============2403319092985585055=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [gup] 17839856fd: stress-ng.vm-splice.ops_per_sec 2158.6% improvement
Date: Fri, 12 Jun 2020 08:07:32 +0800
Message-ID: <20200612000732.GA23169@intel.com>
In-Reply-To: <CAHk-=whCjhBgJv0z6JoOKMyfnBp0WhH6oa=ayuRRLtgJxOkd5Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2403319092985585055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2020 at 01:24:09PM -0700, Linus Torvalds wrote:
> On Wed, Jun 10, 2020 at 9:05 PM kernel test robot <rong.a.chen@intel.co=
m> wrote:
> >
> > FYI, we noticed a 2158.6% improvement of stress-ng.vm-splice.ops_per_se=
c due to commit:
> >
> > commit: 17839856fd588f4ab6b789f482ed3ffd7c403e1f ("gup: document and wo=
rk around "COW can break either way" issue")
> =

> Well, that is amusing, and seeing improvements is always nice, but
> somehow I think the test is broken.
> =

> I can't see why you'd ever see an improvement from that commit, and if
> you do see one, not one by a factor of 20x.
got it, we will double check again, that we go through the data
and it can be reproduced in our environment before sending out report.

> =

> > In addition to that, the commit also has significant impact on the foll=
owing tests:
> >
> > | testcase: change | stress-ng: stress-ng.vm-splice.ops_per_sec 372.8% =
improvement        |
> > | testcase: change | stress-ng: stress-ng.vm-splice.ops_per_sec 2052.7%=
 improvement       |
> =

> Ok, so it's affecting other runs of the same test, and the smaller
> ("only" 378%) improvement seems to be just from using fewer threads.
> =

> So maybe forcing the COW ends up avoiding some very specific cache
> thrashing case.
> =

> > To reproduce:
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> =

> Is there some place where you'd actually _see_ what
> "stress-ng.vm-splice.ops_per_sec" actually means and does?
> =

> Yeah, I can go and find the actual stress-ng git repo, and take a
> look. I kind of did. But the step from your "to reproduce" to actually
> figuring out what is going on is pretty big.
> =

> It would be nice to know what it actually does - do you have a
> database of descriptions for the different tests and how to run them
> individually or anything like that?
Hi Linus, it is currently embedded in different scripts, like tests/stress-=
ng,
but it now depends on up level script like lkp run to call them to pass the
parameters from job.yaml. It can provide some basic information. Meanwhile
we try to generate a reproduce script for test running, I add more info
in below reply, kindly check.

> =

> IOW, rather than the above "just run all fo the lkp scripts",
> something like how to run the actual individual test would be good.
> =

> IOW how do those yaml files translate into _actually_ running the
> 'stress-ng' program?
Thanks Linus for your feedback, we will improve this to provide
more clear reproduce information.

In the attachment, there's a reproduce script with content like below,
which is another way to directly run the stress-ng. This helps to show
which parameters we are using when having this report. Would you mind to
have a look?

for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
do
	online_file=3D"$cpu_dir"/online
	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue

	file=3D"$cpu_dir"/cpufreq/scaling_governor
	[ -f "$file" ] && echo "performance" > "$file"
done

 "stress-ng" "--timeout" "30" "--times" "--verify" "--metrics-brief" "--seq=
uential" "96" "--class" "pipe" "--exclude" "spawn,exec,swap"

Thanks

> =

>                 Linus
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============2403319092985585055==--

