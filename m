Content-Type: multipart/mixed; boundary="===============2307738906912331837=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [aio] e52ddd946a: xfstests generic/211 fail
Date: Sun, 23 Mar 2014 08:40:09 +0800
Message-ID: <20140323004009.GA13869@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2307738906912331837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

We noticed xfstests fail and the first bad commit is

commit e52ddd946ab1def55c8282c8b3d0e80403abae12
Author:     Benjamin LaHaise <bcrl@kvack.org>
AuthorDate: Fri Mar 21 14:26:43 2014 -0400

    aio: ensure access to ctx->ring_pages is correctly serialised
    =

# good: [dcb99fd9b08cfe1afe426af4d8d3cbc429190f15] Linux 3.14-rc7
git bisect good dcb99fd9b08cfe1afe426af4d8d3cbc429190f15
# bad: [61fabf948117a9f91e679323b49e6a0cf56d25a6] 0day head guard for 'deve=
l-hourly-2014032214'
git bisect bad 61fabf948117a9f91e679323b49e6a0cf56d25a6
# good: [56ba91913d9f2c108be0e33eeb4a473863d91600] Merge 'regulator/topic/b=
cm590xx' into devel-hourly-2014032214
git bisect good 56ba91913d9f2c108be0e33eeb4a473863d91600
# good: [a3b8ced9d666d7e4da8e4867d58767e8e5e0a7c9] Merge 'kees/nak_fw-relat=
ive' into devel-hourly-2014032214
git bisect good a3b8ced9d666d7e4da8e4867d58767e8e5e0a7c9
# bad: [7a74b3c608ebb48fd99791f570c24387104dd425] Merge 'kees/nak_recv-leak=
' into devel-hourly-2014032214
git bisect bad 7a74b3c608ebb48fd99791f570c24387104dd425
# good: [4b518d474c67c909d82f4ed6242dee38a681daf8] Merge 'ath6kl/ath-next-t=
est' into devel-hourly-2014032214
git bisect good 4b518d474c67c909d82f4ed6242dee38a681daf8
# good: [37e32762b783f435265c1a8a86dd074c81ad87f2] Merge 'spi/for-next' int=
o devel-hourly-2014032214
git bisect good 37e32762b783f435265c1a8a86dd074c81ad87f2
# bad: [655a90c342c5878de4a3fef60b1a7a0cd18bc08c] Merge 'aio-next/master' i=
nto devel-hourly-2014032214
git bisect bad 655a90c342c5878de4a3fef60b1a7a0cd18bc08c
# good: [v3.14-rc6] Linux 3.14-rc6
git bisect good v3.14-rc6
# bad: [e52ddd946ab1def55c8282c8b3d0e80403abae12] aio: ensure access to ctx=
->ring_pages is correctly serialised
git bisect bad e52ddd946ab1def55c8282c8b3d0e80403abae12
# good: [v3.14-rc6] Linux 3.14-rc6
git bisect good v3.14-rc6
# bad: [e52ddd946ab1def55c8282c8b3d0e80403abae12] aio: ensure access to ctx=
->ring_pages is correctly serialised
git bisect bad e52ddd946ab1def55c8282c8b3d0e80403abae12
# good: [e6a4b6f5eaa8478b7a0b9a17e40c51463631db1a] Merge branch 'for-linus'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
git bisect good e6a4b6f5eaa8478b7a0b9a17e40c51463631db1a
# good: [8712a00514e50aafa7c9bf5cd3955fa60758e53b] Merge branch 'akpm' (pat=
ches from Andrew Morton)
git bisect good 8712a00514e50aafa7c9bf5cd3955fa60758e53b
# first bad commit: [e52ddd946ab1def55c8282c8b3d0e80403abae12] aio: ensure =
access to ctx->ring_pages is correctly serialised

Thanks,
Fengguang

--===============2307738906912331837==--

