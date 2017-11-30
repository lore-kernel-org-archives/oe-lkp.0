Content-Type: multipart/mixed; boundary="===============7614708834293928933=="
MIME-Version: 1.0
From: Jason Baron <jbaron@akamai.com>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: use-after-scope in ep_poll+0x5cd/0xc90
Date: Thu, 30 Nov 2017 13:57:16 -0500
Message-ID: <519d86ca-1de8-060d-487f-0ee90451b957@akamai.com>
In-Reply-To: <20171130034139.o5br7xc57buhnseb@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7614708834293928933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 11/29/2017 10:41 PM, Fengguang Wu wrote:
> Hello,
> =

> FYI this happens in mainline kernel 4.15.0-rc1.
> It looks a new regression and bisect is on the way.
> =

> It occurs in 3 out of 3 boots.
> =

> [   35.704690] init: Failed to create pty - disabling logging for job
> [   35.706676] init: Temporary process spawn error: No such file or direc=
tory
> [   35.731988] init: Failed to create pty - disabling logging for job
> [   35.734084] init: Temporary process spawn error: No such file or direc=
tory
> [   35.737946] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   35.739635] BUG: KASAN: use-after-scope in ep_poll+0x5cd/0xc90:
> 						ep_send_events at fs/eventpoll.c:1700
> 						 (inlined by) ep_poll at fs/eventpoll.c:1829

This seems to be pointing out that 'struct ep_send_events_data esed' on
line 1700 (below) is being used out of scope?

1697 static int ep_send_events(struct eventpoll *ep,

1698                           struct epoll_event __user *events, int
maxevents)
1699 {

1700         struct ep_send_events_data esed;

1701

1702         esed.maxevents =3D maxevents;

1703         esed.events =3D events;

1704

1705         return ep_scan_ready_list(ep, ep_send_events_proc, &esed,
0, false);

There have been some epoll changes new to 4.15 that would be tempting to
blame, but I don't see anything obvious wrong and the usage of 'esed'
hasn't really changed.

So I'm curious to see where your bisect leads. There also seems to be a
number of reports of false positives with KASAN out of scope reported
recently, so I'm not sure if this could be a false positive?

Thanks,

-Jason

--===============7614708834293928933==--

