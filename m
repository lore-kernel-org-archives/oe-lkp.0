Content-Type: multipart/mixed; boundary="===============2630245281571151736=="
MIME-Version: 1.0
From: Junxiao Bi <junxiao.bi@oracle.com>
To: lkp@lists.01.org
Subject: Re: ocfs2 test for 0-day test
Date: Fri, 04 Dec 2015 13:48:47 +0800
Message-ID: <F2467EE2-498F-42C4-9358-3F1F002459B1@oracle.com>
In-Reply-To: <20151204030433.GA23401@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2630245281571151736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> =E5=9C=A8 2015=E5=B9=B412=E6=9C=884=E6=97=A5=EF=BC=8C=E4=B8=8A=E5=8D=8811=
:04=EF=BC=8CFengguang Wu <fengguang.wu@intel.com> =E5=86=99=E9=81=93=EF=
=BC=9A
> =

> Hi Junxiao,
> =

> On Tue, Dec 01, 2015 at 10:36:51AM +0800, Junxiao Bi wrote:
>> Hi Fengguang,
>> =

>> I heard you ever asked for test cases from subsystems to merge into your
>> 0-day test framework. For ocfs2, we have a test project "ocfs2-test",
>> its git tree at
>> https://oss.oracle.com/git/ocfs2-tools.git/ocfs2-tools-1.8.4?p=3Docfs2-t=
est.git;a=3Dsummary
>> . There is a README in it about test cases and steps to setup test env.
>> =

>> Recently we fixed lots of issues of it and I am using it to test ocfs2
>> mainline regularly. Two regression bugs have been found by it. It's a
>> little pain for me that I have to analysis and fix regression bugs
>> manually. Since 0-day test supports auto bisect, I am curious whether
>> you are interested in merging it into your 0-day test?
> =

> Yes it's good to test ocfs2 and thanks for the info! Currently it's
> Xiaolong (CCed) taking care of the test cases. So it's up to him to
> schedule the merging of ocfs2-test.
Fengguang, glad to hear that, Thanks a lot.
Xiaolong, any ocfs2-test issue, feel free to contact me.

Thanks,
Junxiao.
> =

> Thanks,
> Fengguang


--===============2630245281571151736==--

