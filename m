Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C03C8EA
	for <oe-lkp@lists.linux.dev>; Fri, 28 Jul 2023 08:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B465C433C8;
	Fri, 28 Jul 2023 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690531620;
	bh=SA6A0yrELgyo+eU0lbBKfgUSEb8O2y86fT7korpoL+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKjSac6+s1O1BFRDRt3KJXlNfmtkeUFgxzL9bivmAOZYlD56X7PApiT3jiFLSA+sf
	 95iXJ0TOzO40qcC9gk1/fUuyDhjxl6Se+JFYaT86iEwUnZxvPHrMZkOYQOLPwWI+NP
	 F0LWIyto9CBoVtwHZ4rk7dzVhVtg9M7Fz+2Vi0qy3Dwf3SFhLM06cLY3dezQJBfIkP
	 q7OC41NAUTSnYK3FnOe8JuvzPeDHGecv7acPyHv5SzJe59+oa+wYYI14MK/LLesRPD
	 Y4XWYGdtVP2/E4A645ddzEuC3S0J40qF3jx/+GzOxAeEJ7W2pBZ7sXh0SrZJpSoPQZ
	 wS6E25n0WwXPA==
From: Christian Brauner <brauner@kernel.org>
To: Chuck Lever <cel@kernel.org>,
	oliver.sang@intel.com
Cc: Christian Brauner <brauner@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	oe-lkp@lists.linux.dev,
	ying.huang@intel.com,
	feng.tang@intel.com,
	fengwei.yin@intel.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RFC] libfs: Remove parent dentry locking in offset_iterate_dir()
Date: Fri, 28 Jul 2023 10:06:49 +0200
Message-Id: <20230728-sorglos-krempel-7f7b18c4c247@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To:  <169030957098.157536.9938425508695693348.stgit@manet.1015granger.net>
References:  <169030957098.157536.9938425508695693348.stgit@manet.1015granger.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353; i=brauner@kernel.org; h=from:subject:message-id; bh=SA6A0yrELgyo+eU0lbBKfgUSEb8O2y86fT7korpoL+s=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQcLhefcL/u7cnS23MzZCTuNJ6VOifrzPiA7TCDr8wSrlsW N7/UdJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkuSfDfzeVyGoH2R1vNgWuaf+9Ji tiygMr16IzFcY1CTfm/on7Lc7I8Htb6KWyKaqHH/WuzGxyTNB8wZjnNaOFa+/fjF/CbxiSWAE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Tue, 25 Jul 2023 14:31:04 -0400, Chuck Lever wrote:
> Since offset_iterate_dir() does not walk the parent's d_subdir list
> nor does it manipulate the parent's d_child, there doesn't seem to
> be a reason to hold the parent's d_lock. The offset_ctx's xarray can
> be sufficiently protected with just the RCU read lock.
> 
> Flame graph data captured during the git regression run shows a
> 20% reduction in CPU cycles consumed in offset_find_next().
> 
> [...]

I've picked this up. It would be very nice if we could get a perf test
from lkp for this fix.

---

Applied to the vfs.tmpfs branch of the vfs/vfs.git tree.
Patches in the vfs.tmpfs branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.tmpfs

[1/1] libfs: Remove parent dentry locking in offset_iterate_dir()
      https://git.kernel.org/vfs/vfs/c/01c45fd0472c
