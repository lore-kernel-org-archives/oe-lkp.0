Content-Type: multipart/mixed; boundary="===============4371367531835204759=="
MIME-Version: 1.0
From: David Ahern <dsahern@gmail.com>
To: lkp@lists.01.org
Subject: Re: [net/ipv6] 4ed591c8ab: kernel_selftests.net.fib-onlink-tests.sh.fail
Date: Fri, 02 Nov 2018 21:53:38 -0600
Message-ID: <57c4c8ec-4a81-bbee-c153-54524b26da11@gmail.com>
In-Reply-To: <20181102021145.GI24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4371367531835204759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/1/18 8:11 PM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 4ed591c8ab44e711e56b8e021ffaf4f407c045f5 ("net/ipv6: Allow onlink=
 routes to have a device mismatch if it is the default route")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

our mileage varies.

When I run fib-onlink-tests.sh I get:
Tests passed:  38
Tests failed:   0

The said patch does fix a bug with onlink routes and the test cases were
updated in the same patch. I this case you can not mix and match tests
and kernels -- ie., running new tests on older kernel will generate a
failure. I am guessing that is the case here.

--===============4371367531835204759==--

