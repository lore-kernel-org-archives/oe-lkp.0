Content-Type: multipart/mixed; boundary="===============3415452135014945568=="
MIME-Version: 1.0
From: Josh Don <joshdon@google.com>
To: lkp@lists.01.org
Subject: Re: [sched] 663017c554: WARNING:at_kernel/sched/core.c:#scheduler_tick
Date: Thu, 18 Mar 2021 13:41:59 -0700
Message-ID: <CABk29Nu0+k3dLa5T-Z99EE7FdVSa1wb_OT3zTbXKUaf5Tb-iWA@mail.gmail.com>
In-Reply-To: <20210318143158.GB17012@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3415452135014945568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The warning is WAI (holding spinlock for 100ms). However, since this
is expected for locktorture, it makes sense to not have the warning
enabled while the test is running. I can add that to the patch.
--===============3415452135014945568==--

