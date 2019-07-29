Content-Type: multipart/mixed; boundary="===============5233947306405089446=="
MIME-Version: 1.0
From: Liu Yiding <liuyd.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [BUG] unixbench: libperl5.28 does not exist on ubuntu-18.04
Date: Mon, 29 Jul 2019 16:35:11 +0800
Message-ID: <4b8f1900-db29-d43b-f31d-da791b37391e@cn.fujitsu.com>
In-Reply-To: <46723510-0ff8-de18-3260-e050b4d3bc4d@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5233947306405089446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry, please ignore the previous one, i mistook the problem.

The root cause is that ubuntu-18.04 only support libperl5.26=C2=A0 and =

perl-modules-5.26.


 >>=C2=A0 Is ubuntu 18.04 not a supported distro? If it is supported, it =

seems that

we will need a way to specify to install whichever version of the =

package is available.


Yes, LKP supports ubuntu18.04.=C2=A0 lkp install will read =

distro/depends/unixbench to install

needed deps, packages which recorded in distro/depends/unixbench are =

based on Debian9.


To solve this similar problem, you could add mapping deps to =

/distro/adaptation/ubuntu.

e.g. for this case:

------

diff --git a/distro/adaptation/ubuntu b/distro/adaptation/ubuntu
index c7489ead..ee26e4f5 100644
--- a/distro/adaptation/ubuntu
+++ b/distro/adaptation/ubuntu
@@ -14,3 +14,5 @@ libbz2-1.0:libbz2-dev
 =C2=A0iblz4-1:liblz4-dev
 =C2=A0zlib1g:zlib1g-dev
 =C2=A0libgflags2v5:libgflags-dev
+perl-modules-5.24:perl-modules-5.26
+libperl5.24:libperl5.26

------


On 7/29/19 3:21 PM, Liu Yiding wrote:
> Hi, John. please update lkp-tests. commit =

> 8de082ad179f96187c37471db537068691fed355 has decreased perl to stable =

> 5.24 version.
>
>
> On 7/25/19 10:53 PM, Allen, John wrote:
>> 7cd78129d06e3c8fd47eaab4ff seems to have introduced an issue with =

>> ubuntu-18.04.
>> The patch changes the install dependencies for ubuntu to =

>> perl-modules-5.28 and
>> libperl5.28 from 5.26. However, ubuntu-18.04 repos seem to only =

>> contain version
>> 5.26. Is ubuntu 18.04 not a supported distro? If it is supported, it =

>> seems that
>> we will need a way to specify to install whichever version of the =

>> package is
>> available. Ideally, it would be nice to be able to specify something =

>> like
>> "perl-modules >=3D 5.26", but the current method of installing packages =

>> doesn't
>> seem to be equipped to handle that sort of thing.
>>
>> Thanks,
>> John
>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp
>>
>>
-- =

Best regards.
Liu Yiding




--===============5233947306405089446==--

