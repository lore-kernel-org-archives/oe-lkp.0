Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032CE107B9
	for <oe-lkp@lists.linux.dev>; Tue, 26 Sep 2023 12:15:05 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20230926121503epoutp0296e4856dcee6a673bb471398ddd964ac~IceicMu4B0361503615epoutp021
	for <oe-lkp@lists.linux.dev>; Tue, 26 Sep 2023 12:15:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20230926121503epoutp0296e4856dcee6a673bb471398ddd964ac~IceicMu4B0361503615epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1695730503;
	bh=HOYT3hUasYyuDjRbUk7i1COs3g1DY+0BnNok1/lfUqY=;
	h=Subject:Reply-To:From:To:In-Reply-To:Date:References:From;
	b=s5UW2n0QGVnqLYw8C407AZCZEnzuadAWSiE6IRGIbPMOODCPefWv7HYeCRA+WVark
	 NN2EWmka5hxFLkRgx49pCrBkqStYi++dnTPr38hqnsOlYs+xyabhTeSwrne+9MXPos
	 x0OZJL+JFdEAo02hhzjSlkqrsfuOwfIQP5f3MX54=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230926121502epcas1p195594f20c7d6df31cdb38fc7232e4711~IcehoP_Yo1553515535epcas1p1j;
	Tue, 26 Sep 2023 12:15:02 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.250]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4RvzFy0BHWz4x9Px; Tue, 26 Sep
	2023 12:15:02 +0000 (GMT)
X-AuditID: b6c32a36-339fa700000025af-60-6512cb45e7ae
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BE.0A.09647.54BC2156; Tue, 26 Sep 2023 21:15:01 +0900 (KST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: Re: [linux-next:master] [maple_tree] 2041864a22:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Reply-To: jason.sim@samsung.com
Sender: Jaeseon Sim <jason.sim@samsung.com>
From: Jaeseon Sim <jason.sim@samsung.com>
To: Peng Zhang <zhangpeng.00@bytedance.com>, "Liam R. Howlett"
	<Liam.Howlett@Oracle.com>, kernel test robot <oliver.sang@intel.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, "lkp@intel.com"
	<lkp@intel.com>, Linux Memory Management List <linux-mm@kvack.org>, Andrew
	Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>, "maple-tree@lists.infradead.org"
	<maple-tree@lists.infradead.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ee06ab24-0455-d212-e995-745f83366e00@bytedance.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230926121501epcms1p85a8295b53a5dd25eea9eea36657472e0@epcms1p8>
Date: Tue, 26 Sep 2023 21:15:01 +0900
X-CMS-MailID: 20230926121501epcms1p85a8295b53a5dd25eea9eea36657472e0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmga7raaFUg9nLLC3mrF/DZrG94QG7
	xb01/1ktXjU/YrPYsLKByeLaRmuLBZ/+slhMvrSAzeL3jzlsFk///GV24PL4d2INm8eCTaUe
	m1doeSze85LJY9OnSeweJ2b8ZvHYvKTe48XmmYweH5/eYgngjMq2yUhNTEktUkjNS85PycxL
	t1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6U0mhLDGnFCgUkFhcrKRvZ1OUX1qS
	qpCRX1xiq5RakJJTYFagV5yYW1yal66Xl1piZWhgYGQKVJiQnfF+wlnGggnGFQeOLmdsYHxm
	2MXIwSEhYCIx7ZRlFyMXh5DADkaJw913mUHivAKCEn93CIPEhQU6GSUetM9n7WLkBCqSlzi7
	pYERxBYW0JY4tfIiM4jNJqAp0XVhCztIg4jAJWaJyW+es4EkJAR4JWa0P2WBsKUlti/fCtbM
	KeAosan5FlRcVOLm6rfsMPb7Y/MZIWwRidZ7Z5khbEGJBz93Q8WlJM60LYHqLZZYv+Y6E4Rd
	I3H0yX6ouLlEw9uVYDfwCvhKTNx+HKyXRUBV4sDto1BzXCSmrLgANp8Z6JllC1+DPc8M9Mz6
	XfoQJYoSO3/PZYQo4ZN497WHFeatHfOeQK1Vlvj47QIjJDwlJSbsMocIe0is7LnPBgnbB0wS
	x+aeYJ/AKD8LEbyzkCyehbB4ASPzKkax1ILi3PTUYsMCI3iEJufnbmIEp1Itsx2Mk95+0DvE
	yMTBeIhRgoNZSYT31zO+VCHelMTKqtSi/Pii0pzU4kOMpkAvT2SWEk3OBybzvJJ4QxNLAxMz
	IxMLY0tjMyVx3jmPe1OEBNITS1KzU1MLUotg+pg4OKUamGRM/+U843awnGc+Qd66eGqv193d
	WcIzd7w2OlwyoT5NNEHTT0DhrZea3okHQkeko/bs4++9nPakeO0/zSsnLfqmWK1Osf50dH7c
	44pIlU+NmZ5ZZ44eUxXZuy7t2dpE3qvaH3P7prNMcmVP3f545bkzU/QOrlQOijFP8T2swjIx
	wH93SITRm9lKE/UDp/Q6mXmn5ejEzGi9f6BhRddDK0mLkBl9NnU/kqdYW379a+/06f9EleDK
	Is4SHdXTFXvD6mZy3P5dUSR/0GhTV2jCxnfaHGx/FlgbPvslfzc9pn1ivpmD6cTluavnPxHm
	jp0XUJF1zGt646HVPFXL3Wr0v6uG37yxeY9f+maXx/t3KLEUZyQaajEXFScCAKyHI58uBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230924135059epcas1p4c0595d07a7d50da7a877a0af696d9c78
References: <ee06ab24-0455-d212-e995-745f83366e00@bytedance.com>
	<202309242123.7ebe65b5-oliver.sang@intel.com>
	<20230925123907epcms1p82db5bc72fa25e390986f2e195a58b362@epcms1p8>
	<08cffec5-a3ae-f02a-ca97-d93f7a17eaee@bytedance.com>
	<20230925152353.zoezenruphilf2kc@revolver>
	<CGME20230924135059epcas1p4c0595d07a7d50da7a877a0af696d9c78@epcms1p8>

>>=E5=9C=A8=202023/9/25=2023:23,=20Liam=20R.=20Howlett=20=E5=86=99=E9=81=93=
:=0D=0A>>>=20*=20Peng=20Zhang=20<zhangpeng.00=40bytedance.com>=20=5B230925=
=2008:47=5D:=0D=0A>>>>=0D=0A>>>>=0D=0A>>>>=20=E5=9C=A8=202023/9/25=2020:39,=
=20Jaeseon=20Sim=20=E5=86=99=E9=81=93:=0D=0A>>>>>>=20Hello,=0D=0A>>>>>>=0D=
=0A>>>>>>=20kernel=20test=20robot=20noticed=20=22BUG:sleeping_function_call=
ed_from_invalid_context_at_include/linux/sched/mm.h=22=20on:=0D=0A>>>>>>=0D=
=0A>>>>>>=20commit:=202041864a22d4f4e900d0a3def4985432a21d8e6d=20(=22maple_=
tree:=20use=20mas_node_count_gfp()=20in=20mas_expected_entries()=22)=0D=0A>=
>>>>>=20https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git=20=
master=0D=0A>>>>>>=0D=0A>>>>>>=20=5Btest=20failed=20on=20linux-next/master=
=20940fcc189c51032dd0282cbee4497542c982ac59=5D=0D=0A>>>>>>=0D=0A>>>>>>=20in=
=20testcase:=20boot=0D=0A>>>>>>=0D=0A>>>>>>=20compiler:=20gcc-9=0D=0A>>>>>>=
=20test=20machine:=20qemu-system-x86_64=20-enable-kvm=20-cpu=20SandyBridge=
=20-smp=202=20-m=2016G=0D=0A>>>>>>=0D=0A>>>>>>=20(please=20refer=20to=20att=
ached=20dmesg/kmsg=20for=20entire=20log/backtrace)=0D=0A>>>>>>=0D=0A>>>>>>=
=0D=0A>>>>>>=0D=0A>>>>>>=20If=20you=20fix=20the=20issue=20in=20a=20separate=
=20patch/commit=20(i.e.=20not=20just=20a=20new=20version=20of=0D=0A>>>>>>=
=20the=20same=20patch/commit),=20kindly=20add=20following=20tags=0D=0A>>>>>=
>=20=7C=20Reported-by:=20kernel=20test=20robot=20<oliver.sang=40intel.com>=
=0D=0A>>>>>>=20=7C=20Closes:=20https://lore.kernel.org/oe-lkp/202309242123.=
7ebe65b5-oliver.sang=40intel.com=0D=0A>>>>>>=0D=0A>>>>>>=0D=0A>>>>>>=20=5B=
=20=20113.582828=5D=5B=20=20=20=20T1=5D=20BUG:=20sleeping=20function=20call=
ed=20from=20invalid=20context=20at=20include/linux/sched/mm.h:306=0D=0A>>>>=
>>=20=5B=20=20113.583602=5D=5B=20=20=20=20T1=5D=20in_atomic():=201,=20irqs_=
disabled():=200,=20non_block:=200,=20pid:=201,=20name:=20swapper/0=0D=0A>>>=
>>>=20=5B=20=20113.584246=5D=5B=20=20=20=20T1=5D=20preempt_count:=201,=20ex=
pected:=200=0D=0A>>>>>>=20=5B=20=20113.584613=5D=5B=20=20=20=20T1=5D=20RCU=
=20nest=20depth:=200,=20expected:=200=0D=0A>>>>>>=20=5B=20=20113.584983=5D=
=5B=20=20=20=20T1=5D=201=20lock=20held=20by=20swapper/0/1:=0D=0A>>>>>>=20=
=5B=20113.585344=5D=5B=20T1=5D=20=230:=20ffffc9000001fc10=20(&mt->ma_lock)=
=7B+.+.=7D-=7B2:2=7D,=20at:=20check_forking+0x1e0/0x5c0=0D=0A>>>>>=20Dear=
=20Liam,=0D=0A>>>>>=0D=0A>>>>>=20mas_expected_entries()=20in=20check_forkin=
g()=20tried=20to=20sleep=20while=20holding=20spinlock,=20and=20panic=20occu=
rred.=0D=0A>>>>>=20I=20think=20mas_expected_entries()=20in=20lib/test_maple=
_tree.c=20need=20to=20be=20modified=20to=20align=20with=20commit=202041864a=
22d4f.=0D=0A>>>>>=20Do=20you=20have=20any=20idea=20for=20it?=20or=20Could=
=20you=20give=20some=20guide?=0D=0A>>>=20=0D=0A>>>=20There=20are=20two=20wa=
ys=20we=20could=20fix=20this:=20one=20is=20to=20pass=20through=20the=20GFP=
=0D=0A>>>=20flag=20and=20use=20different=20flags=20in=20the=20test=20module=
,=20the=20other=20is=20to=20move=0D=0A>>>=20the=20testing=20out=20of=20the=
=20module=20and=20into=20the=20userspace=20tests.=0D=0A>>Actually,=20there=
=20is=20a=20third=20method=20that=20can=20be=20used=20to=20solve=20this=0D=
=0A>>problem,=20which=20is=20to=20use=20an=20externally=20sleepable=20lock,=
=20such=20as=0D=0A>>rw_semaphore.=0D=0A>>>=20=0D=0A>>>=20Adding=20the=20GFP=
=20flag=20to=20the=20interface=20might=20be=20needed=20in=20the=20future=20=
but=0D=0A>>>=20there's=20no=20need=20for=20that=20now.=20=20I=20was=20conce=
rned=20about=20too=20large=20of=20a=0D=0A>>>=20change=20to=20the=20existing=
=20code,=20and=20this=20would=20increase=20the=20runtime=20code=0D=0A>>>=20=
changes=20-=20although=20not=20a=20lot.=0D=0A>>>=20=0D=0A>>>=20I=20think=20=
the=20best=20thing=20would=20be=20to=20move=20the=20forking=20test=20out=20=
of=20the=0D=0A>>>=20module=20into=20the=20userspace=20testing=20(tools/test=
ing/radix-tree/maple.c)=0D=0A>>>=20=0D=0A>>>>=20This=20is=20just=20a=20test=
=20module.=20The=20work=5B1=5D=20I'm=20doing=20modifies=20this=20place=0D=
=0A>>>>=20and=20it=20will=20fix=20this=20bug.=0D=0A>>>=20=0D=0A>>>=20Thanks=
=20Peng.=20=20This=20is=20a=20temporary=20fix=20for=20upstream,=20but=20is=
=20needed=20for=0D=0A>>>=20the=20LTS=20kernels=20as=20well.=20=20I've=20men=
tioned=20your=20patches=20to=20others,=20so=0D=0A>>>=20don't=20think=20they=
=20aren't=20noticed=20-=20they=20are=20eagerly=20awaited.=0D=0A>>>=20=0D=0A=
>>>=20Since=20your=20patch=20adds=20the=20necessary=20GFP=20flag,=20we=20co=
uld=20move=20the=0D=0A>>>=20check_forking=20test=20back=20in=20your=20updat=
e,=20(patch=207/9=20=5B1=5D)=20which=20avoids=20the=0D=0A>>>=20GFP_KERNEL=
=20flag=20(thanks=21),=20if=20it=20is=20moved.=20=20I=20think=20it's=20wort=
h=20while=20to=0D=0A>>>=20do=20since=20you=20already=20have=20a=20lot=20of=
=20userspace=20tests=20as=20well=20that=20uses=0D=0A>>>=20GFP_KERNEL=20(4/9=
=20=5B2=5D)=20and=20it's=20good=20to=20keep=20as=20much=20in=20the=20kernel=
=20module=0D=0A>>>=20as=20possible.=0D=0A>>>=20=0D=0A>>>=20By=20the=20way=
=20Peng,=20I=20have=20gotten=20complaints=20(I=20cannot=20find=20a=20refere=
nce=0D=0A>>>=20quickly)=20from=20older=20CPUs=20taking=20a=20long=20time=20=
on=20the=20test=20module.=20=20You=20are=0D=0A>>>=20making=20things=20faste=
r,=20but=20I=20just=20wanted=20you=20to=20be=20aware=20of=20that=20in=20cas=
e=0D=0A>>>=20you=20add=20tests=20in=20the=20future=20that=20cause=20complai=
nts=20:)=20=20I=20still=20think=20it=0D=0A>>>=20is=20worth=20keeping=20as=
=20much=20as=20possible=20in=20that=20module=20-=20it's=20a=20more=20valid=
=0D=0A>>>=20test=20scenario=20and=20it=20still=20runs=20from=20the=20usersp=
ace=20testing.=0D=0A>>I=20understand=20this=20now,=20and=20I=20will=20take=
=20this=20into=20consideration=20when=0D=0A>>adding=20tests=20in=20the=20fu=
ture.=0D=0A>>>=20=0D=0A>>>=20...=0D=0A>>>=20=0D=0A>>>>=20Thanks.=0D=0A>>>>=
=0D=0A>>>>=20=5B1=5D=20https://lore.kernel.org/lkml/20230925035617.84767-1-=
zhangpeng.00=40bytedance.com/=0D=0A>>>=20=0D=0A>>>=20...=0D=0A>>>=20=0D=0A>=
>>=20Thanks,=0D=0A>>>=20Liam=0D=0A>>>=20=0D=0A>>>=20=5B1=5D=20https://lore.=
kernel.org/lkml/20230925035617.84767-8-zhangpeng.00=40bytedance.com/=0D=0A>=
>>=20=5B2=5D=20https://lore.kernel.org/lkml/20230925035617.84767-5-zhangpen=
g.00=40bytedance.com/=0D=0A>>>=20=0D=0A>>>=20=0D=0A=0D=0AI=20think=20it=20w=
ould=20be=20better=20to=20wait=20for=20Peng's=20revision..=0D=0A=0D=0AThank=
s=20to=20all=0D=0AJaeseon
