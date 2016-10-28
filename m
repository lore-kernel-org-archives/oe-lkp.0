Content-Type: multipart/mixed; boundary="===============3473654228385482106=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: Adding Thermal SoC tree into 0-Day testing
Date: Fri, 28 Oct 2016 22:43:25 +0800
Message-ID: <20161028144325.GA15479@intel.com>
In-Reply-To: <CAC-25o-ydeewuWQYrSQs0FHtrTTqYbdLoUSn5uHZq8U18PwEFg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3473654228385482106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2016 at 07:26:50AM -0700, edubezval(a)gmail.com wrote:
> Philip,
> =

> On Fri, Oct 28, 2016 at 1:29 AM, Philip Li <philip.li@intel.com> wrote:
> > On Thu, Oct 27, 2016 at 10:29:23PM -0700, edubezval(a)gmail.com wrote:
> >> Hello 0-Day team,
> >>
> >> I would like to ask you if you could add my tree to your testing servi=
ce:
> >>
> >> tree: https://git.kernel.org/cgit/linux/kernel/git/evalenti/linux-soc-=
thermal.git/
> >> branches: linus, next, for-kernelci
> >>
> >> Would you also send reports on changes in the branches?
> >
> > sure, np, to confirm, currently we have below repo monitored, and this =
one is a different one, right?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-ther=
mal.git
> >
> =

> Cool, I am still getting familiar with 0-Day. I did not realize you
> guys monitor per repo, not per branch. Great!
thanks, and do you still need us to add the new repo https://git.kernel.org=
/cgit/linux/kernel/git/evalenti/linux-soc-thermal.git/?

> =

> I have a couple of questions.
> =

> How do I access build reports and test reports? Is the mailing list
> the right place, or do you also have a place with your past / current
> results?
Currently you will receive report when there's any regression detected. I w=
ill later add build success notification to you as well.
The place to check is https://lists.01.org/pipermail/kbuild-all/, and https=
://lists.01.org/pipermail/lkp/ for all reports.

> =

> I saw that you do a simple read of thermal zone temperatures, and
> cooling devices actions, which is great for me. If I want to extend
> thermal tests, how do I do it?
> =

> And finally, which archs and devices do you test?
For thermal related questions, let me consult more members and back to you =
later.

> =

> BR,
> =

> >>
> >> BR,
> >>
> >> --
> >> Eduardo Bezerra Valentin
> >> _______________________________________________
> >> LKP mailing list
> >> LKP(a)lists.01.org
> >> https://lists.01.org/mailman/listinfo/lkp
> =

> =

> =

> -- =

> Eduardo Bezerra Valentin

--===============3473654228385482106==--

