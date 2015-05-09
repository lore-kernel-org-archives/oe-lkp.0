Content-Type: multipart/mixed; boundary="===============0296320981006971095=="
MIME-Version: 1.0
From: Chris Metcalf <cmetcalf@ezchip.com>
To: lkp@lists.01.org
Subject: Re: [watchdog] 952c8813073: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Sat, 09 May 2015 10:34:19 -0400
Message-ID: <554E1AEB.3090707@ezchip.com>
In-Reply-To: <20150509125054.GD22912@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0296320981006971095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/9/2015 8:50 AM, Fengguang Wu wrote:
> Hi Chris,
>
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 952c8813073ed240a610f8b44ecea9bdd60b62b4 ("watchdog: add watchdog_=
cpumask sysctl to assist nohz")
>
>
> [...]
> [    0.079378] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)

This bug was fixed by John Hubbard here:

http://permalink.gmane.org/gmane.linux.kernel.next/35308

I ack'ed it on May 6 but I think it hasn't made it from Andrew's tree to li=
nux-next yet.

Thanks!

-- =

Chris Metcalf, EZChip Semiconductor
http://www.ezchip.com


--===============0296320981006971095==--

