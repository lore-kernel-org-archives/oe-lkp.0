Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A1250FD
	for <oe-lkp@lists.linux.dev>; Tue,  3 Oct 2023 13:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DC5C433C7;
	Tue,  3 Oct 2023 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696339344;
	bh=4HJ4lXE/gn+p/GC4BBOANqh3Tq17/zOiY/nqfu3N/6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gYm+00vHtYYsOzjxMEN31pv5biGQGFgdy9kZQ4SIrfILcdj12L49OMRHb65vM0R9K
	 G4IAyXyzOMcB+N8VHE6potlovixV/fXKezOEqf+9kxoJB9N2LelIr+3HXCnaYZiHby
	 N+seD1jPInhKK3f6DpaUx7g+UMQYYEoMzTejIlFGFvcFdx4BFEQRyYuT9rlJdf+JXs
	 UA17Ycft9hXLUmPYFJwZjnt/e02+dsIPUA91GyMF/4ZqMSyPJxQUhpZzdJ88gYguuY
	 klo386RCZAkQVKXpiEBwHD2e0y8KMZ109amfC2/NtAl+F4hlQiSFW0BoIb2QkxCErC
	 eDDeFpiYBlSnQ==
From: Christian Brauner <brauner@kernel.org>
To: amir73il@gmail.com,
	Reuben Hawkins <reubenhwk@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	willy@infradead.org,
	chrubis@suse.cz,
	mszeredi@redhat.com,
	lkp@intel.com,
	linux-fsdevel@vger.kernel.org,
	oliver.sang@intel.com,
	viro@zeniv.linux.org.uk,
	oe-lkp@lists.linux.dev,
	ltp@lists.linux.it
Subject: Re: [PATCH v4] vfs: fix readahead(2) on block devices
Date: Tue,  3 Oct 2023 15:22:16 +0200
Message-Id: <20231003-weglassen-anlassen-e42c8cc2db9a@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003015704.2415-1-reubenhwk@gmail.com>
References: <20231003015704.2415-1-reubenhwk@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; i=brauner@kernel.org; h=from:subject:message-id; bh=4HJ4lXE/gn+p/GC4BBOANqh3Tq17/zOiY/nqfu3N/6k=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTKiDZbBzyNnBxbuIdFoTn7tvbd0O29u9l1Zvy7+E/S6ctp 3+OTOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbidoCRoeN64Tdt5p/nKzIVT0gG2l maepUw1nVu3XHGassLlbNXDjIyLFitNl8j6JPXs2mPguzf3N3nU2Tn8rFq39fEtHXbas/e5wYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Mon, 02 Oct 2023 20:57:04 -0500, Reuben Hawkins wrote:
> Readahead was factored to call generic_fadvise.  That refactor added an
> S_ISREG restriction which broke readahead on block devices.
> 
> In addition to S_ISREG, this change checks S_ISBLK to fix block device
> readahead.  There is no change in behavior with any file type besides block
> devices in this change.
> 
> [...]

On vacation so just picking up smaller (hopefully obvious) stuff.

---

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] vfs: fix readahead(2) on block devices
      https://git.kernel.org/vfs/vfs/c/165bb7140aa4
