Content-Type: multipart/mixed; boundary="===============2868015694264560936=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Wed, 01 Sep 2021 08:12:24 -0700
Message-ID: <877dg0wcrr.fsf@linux.intel.com>
In-Reply-To: <20210901045032.GA21937@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2868015694264560936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Feng Tang <feng.tang@intel.com> writes:
>
> Yes, the tests I did is no matter where the 128B padding is added, the
> performance can be restored and even improved.

I wonder if we can find some cold, rarely accessed, data to put into the
padding to not waste it. Perhaps some name strings? Or the destroy
support, which doesn't sound like its commonly used.

-Andi
--===============2868015694264560936==--

