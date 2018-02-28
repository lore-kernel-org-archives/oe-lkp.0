Content-Type: multipart/mixed; boundary="===============2873329256143667664=="
MIME-Version: 1.0
From: David Ahern <dsahern@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] 6dfb696fc4 [ 17.249909] WARNING: CPU: 0 PID: 493 at include/net/dst.h:242 ip6_rt_copy_init
Date: Tue, 27 Feb 2018 21:41:18 -0700
Message-ID: <c6be43f8-1c10-3b5e-0837-0ed6770dc201@gmail.com>
In-Reply-To: <20180228010002.wvsmsksq63t7r3fy@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2873329256143667664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/27/18 6:00 PM, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/David-Ahern/net-ipv6-Separate-da=
ta-structures-for-FIB-and-data-path/20180226-222416
> =


Thanks for the report - and the service you provide.

I have fixed the problem noted here and pushed an update to the branch.


--===============2873329256143667664==--

