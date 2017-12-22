Content-Type: multipart/mixed; boundary="===============1133295719401409093=="
MIME-Version: 1.0
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: lkp@lists.01.org
Subject: Re: Add git repo to automatic lkp tests
Date: Fri, 22 Dec 2017 13:53:51 +0000
Message-ID: <20171222135351.GB32075@e107981-ln.cambridge.arm.com>
In-Reply-To: <20171222024843.rgevhslzkliisb5x@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1133295719401409093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2017 at 10:48:43AM +0800, Fengguang Wu wrote:
> On Thu, Dec 21, 2017 at 10:54:30AM +0000, Lorenzo Pieralisi wrote:
> >On Thu, Dec 21, 2017 at 06:36:08PM +0800, Fengguang Wu wrote:
> >>On Thu, Dec 21, 2017 at 10:25:57AM +0000, Lorenzo Pieralisi wrote:
> >>>On Thu, Dec 21, 2017 at 08:44:52AM +0800, Fengguang Wu wrote:
> >>>>Hi Lorenzo,
> >>>>
> >>>>On Wed, Dec 20, 2017 at 06:04:55PM +0000, Lorenzo Pieralisi wrote:
> >>>>>Hi guys,
> >>>>>
> >>>>>On Tue, Dec 19, 2017 at 03:13:37PM +0000, Lorenzo Pieralisi wrote:
> >>>>>>Hi,
> >>>>>>
> >>>>>>I would like to ask you please to add this repo:
> >>>>>>
> >>>>>>https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/
> >>>>>>
> >>>>>>to the list of automatically tested trees, actually
> >>>>>>it would be great if compile tests can be carried out
> >>>>>>every time a branch is pushed in the repo, I think
> >>>>>>that's the default.
> >>>>>
> >>>>>Is it possible to add automatic LKP testing for all branches in the
> >>>>>repo above please ?
> >>>>
> >>>>Sure, my pleasure. Just sent the patch to add the repo. It'll take
> >>>>effect after actual deployment.
> >>>
> >>>Thank you very much, I will get a report at the current email
> >>>address correct ?
> >>
> >>The reports will be sent to the commits' author/committer emails.
> >
> >Thank you, I assume the commit report will be sent only if there is a
> >failure right ?
> =

> Right, unless if notify_build_success_branch is specified.
> =

> >Is it possible to configure it so that I also get a report for builds on
> >all branches on the repo regardless of whether they build successfully
> >or not ?
> >
> >It is useful to get a report of successfull builds so that branches
> >can be pushed in upstream trees.
> =

> Sure. I just sent the patch for your linux tree.

It is for my pci tree (see above - but I think you added it already and
it is ok to have both - linux.git and pci.git):

https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/

I have not received any notification yet, thank you very much for
taking care of it.

Lorenzo

--===============1133295719401409093==--

