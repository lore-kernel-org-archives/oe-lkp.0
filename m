Content-Type: multipart/mixed; boundary="===============0610746392291330354=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [selftests/tls] e506342a03: kernel-selftests.net.tls.fail
Date: Wed, 20 Oct 2021 16:27:13 +0800
Message-ID: <20211020082711.GA17084@linux.intel.com>
In-Reply-To: <c8907aec-de04-fbc0-e186-a4997fea77c9@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0610746392291330354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tianjia,

On Mon, Oct 18, 2021 at 02:44:15PM +0800, Tianjia Zhang wrote:
> Hi Philip,
> =

> On 10/18/21 10:50 AM, Philip Li wrote:
> > On Mon, Oct 18, 2021 at 10:40:13AM +0800, Tianjia Zhang wrote:
> > > Hi,
> > > =

> > > This test needs to enable the SM4 algorithm, and the config file you
> > > provided does not enable this algorithm.
> > thanks for the info, we will recheck this. And how about adding
> > this kconfig requirement to tools/testing/selftests/net/config file?
> > =

> =

> I fixed this problem and sent you an email, thanks for your test.

We tested kselftest net-tls again, all subtests passed, thanks!

> =

> Best regards,
> Tianjia
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============0610746392291330354==--

