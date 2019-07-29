Content-Type: multipart/mixed; boundary="===============7343232430112474007=="
MIME-Version: 1.0
From: Oliver Hartkopp <socketcan@hartkopp.net>
To: lkp@lists.01.org
Subject: Re: [can] 60649d4e0a: ltp.can_rcv_own_msgs.fail
Date: Mon, 29 Jul 2019 16:13:15 +0200
Message-ID: <786568d6-bd24-327a-8367-319efbe2cccb@hartkopp.net>
In-Reply-To: <20190729094112.GM22106@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7343232430112474007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Marc,

On 29/07/2019 11.41, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 60649d4e0af6c26b6c423dea9c57f39e823fc0c5 ("can: remove obsolete e=
mpty ioctl() handler")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.=
git master

the kernel test robot is right.

The patch ("can: remove obsolete empty ioctl() handler") leads to a =

return value of -EOPNOTSUPP instead of the former -ENOIOCTLCMD.

As we can see in socket.c ...

https://elixir.bootlin.com/linux/v5.3-rc2/source/net/socket.c#L1041

         /*
          * If this ioctl is unknown try to hand it down
          * to the NIC driver.
          */
         if (err !=3D -ENOIOCTLCMD)
                 return err;

... we need to return -ENOIOCTLCMD to pass the SIOCGIFINDEX ioctl to the =

NIC layer.

Therefore the entire commit needs to be *reverted* to restore the =

required functionality.

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>

Many thanks,
Oliver

--===============7343232430112474007==--

