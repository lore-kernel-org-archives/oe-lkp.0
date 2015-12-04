Content-Type: multipart/mixed; boundary="===============4180502560838979142=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: ocfs2 test for 0-day test
Date: Fri, 04 Dec 2015 11:04:33 +0800
Message-ID: <20151204030433.GA23401@wfg-t540p.sh.intel.com>
In-Reply-To: <565D07C3.2020609@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4180502560838979142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Junxiao,

On Tue, Dec 01, 2015 at 10:36:51AM +0800, Junxiao Bi wrote:
> Hi Fengguang,
> =

> I heard you ever asked for test cases from subsystems to merge into your
> 0-day test framework. For ocfs2, we have a test project "ocfs2-test",
> its git tree at
> https://oss.oracle.com/git/ocfs2-tools.git/ocfs2-tools-1.8.4?p=3Docfs2-te=
st.git;a=3Dsummary
> . There is a README in it about test cases and steps to setup test env.
> =

> Recently we fixed lots of issues of it and I am using it to test ocfs2
> mainline regularly. Two regression bugs have been found by it. It's a
> little pain for me that I have to analysis and fix regression bugs
> manually. Since 0-day test supports auto bisect, I am curious whether
> you are interested in merging it into your 0-day test?

Yes it's good to test ocfs2 and thanks for the info! Currently it's
Xiaolong (CCed) taking care of the test cases. So it's up to him to
schedule the merging of ocfs2-test.

Thanks,
Fengguang

--===============4180502560838979142==--

