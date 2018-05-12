Content-Type: multipart/mixed; boundary="===============8224468696822477766=="
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
To: lkp@lists.01.org
Subject: Re: linux-next: a new pending-fixes branch
Date: Sat, 12 May 2018 10:14:19 +0300
Message-ID: <87603t1h2s.fsf@purkki.adurom.net>
In-Reply-To: <20180512143523.250ab803@canb.auug.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============8224468696822477766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> As an outcome of some discussion, I have added a pending-fixes branch
> to linux-next.  This branch contains Linus' tree merged with branches
> containing only fixes pending for the current release.  The branch is a
> strict subset of linux-next each day (as so rebases like linux-next
> does).
>
> It would be good if this branch could be tested by the 0-Day service
> and any other testing that people do - in the hope of sending fewer
> "fixes causing bugs" patches to Linus.
>
> There is not intention that bug fixes for Linus' tree should
> necessarily be tested in linux-next before being forwarded, but
> (especially for slightly less urgent bugs, at least) it seems like a
> good idea.
>
> I currently have 55 branches of bug fixes included.

Is there a list of branches you use available somewhere? I would like to
check that wireless-drivers is included.

-- =

Kalle Valo

--===============8224468696822477766==--

