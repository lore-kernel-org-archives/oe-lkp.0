Content-Type: multipart/mixed; boundary="===============7040774107909518059=="
MIME-Version: 1.0
From: David Ahern <dsa@cumulusnetworks.com>
To: lkp@lists.01.org
Subject: Re: [net] 21bb45b419: kmsg.unregister_netdevice:waiting_for_br-lan_to_become_free.Usage_count=
Date: Mon, 29 Feb 2016 11:03:31 -0800
Message-ID: <56D49603.4010900@cumulusnetworks.com>
In-Reply-To: <87si0byk5w.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7040774107909518059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/29/16 12:50 AM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> https://github.com/0day-ci/linux  David-Ahern/net-ipv6-Make-address-flush=
ing-on-ifdown-optional/20160214-062626
> commit 21bb45b419243ee4d9d74f1d1f97164fbfc481c3 ("net: ipv6: Make address=
 flushing on ifdown optional")
>
>
> [  136.160531] unregister_netdevice: waiting for br-lan to become free. U=
sage count =3D 1
>

How do I get the series of commands run? From the logs it looks like =

there is a creation of a bridge, eth0 enslavement, admin down on bridge =

and then delete of the bridge. When I run those commands in a VM I do =

not hit the usage count of 1, so I am clearly missing some commands.

Thanks for the report,
David

--===============7040774107909518059==--

